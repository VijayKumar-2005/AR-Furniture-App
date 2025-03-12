import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ARScreen extends StatefulWidget {
  final CameraDescription camera;
  final String selectedImage;
  final String selectedDescription;
  final String selectedName;
  final double selectedPrice;
  final double selectedRating;
  const ARScreen({
    super.key,
    required this.camera,
    required this.selectedImage,
    required this.selectedDescription,
    required this.selectedName,
    required this.selectedPrice,
    required this.selectedRating,
  });

  @override
  ArScreenState createState() => ArScreenState();
}

class ArScreenState extends State<ARScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  double _imageScale = 1.0;
  Offset _imageOffset = Offset(100, 200);

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_backspace,
            size: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          "AR View",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'Images/splash_background.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          Column(
            children: [
              Expanded(
                flex: 1, 
                child: Stack(
                  children: [
                    FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: CameraPreview(_controller),
                              ),
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    Positioned(
                      left: _imageOffset.dx,
                      top: _imageOffset.dy,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            _imageOffset += details.delta;
                          });
                        },
                        child: Transform.scale(
                          scale: _imageScale,
                          child: Image.asset(
                            widget.selectedImage,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                  widget.selectedName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    fontStyle: FontStyle.italic
                  ),
                  textAlign: TextAlign.center
              ),
              Text(
                widget.selectedDescription,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Price:${widget.selectedPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "Rating:${widget.selectedRating.toString()}",
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Slider(
                  value: _imageScale,
                  min: 0.5,
                  max: 3.0,
                  onChanged: (value) {
                    setState(() {
                      _imageScale = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}