--!strict
-- TODO(marcus): just steal from Roblox-TS
type creatableinstances = {
	Accessory: Accessory;
    AccessoryDescription: AccessoryDescription;
    Accoutrement: Accoutrement;
    Actor: Actor;
    AdGui: AdGui;
    AdPortal: AdPortal;
    AirController: AirController;
    AlignOrientation: AlignOrientation;
    AlignPosition: AlignPosition;
    AngularVelocity: AngularVelocity;
    Animation: Animation;
    AnimationConstraint: AnimationConstraint;
    AnimationController: AnimationController;
    AnimationGraphDefinition: AnimationGraphDefinition;
    AnimationNodeDefinition: AnimationNodeDefinition;
    AnimationRigData: AnimationRigData;
    Animator: Animator;
    Annotation: Annotation;
    ArcHandles: ArcHandles;
    Atmosphere: Atmosphere;
    AtmosphereSensor: AtmosphereSensor;
    Attachment: Attachment;
    AudioAnalyzer: AudioAnalyzer;
    AudioChannelMixer: AudioChannelMixer;
    AudioChannelSplitter: AudioChannelSplitter;
    AudioChorus: AudioChorus;
    AudioCompressor: AudioCompressor;
    AudioDeviceInput: AudioDeviceInput;
    AudioDeviceOutput: AudioDeviceOutput;
    AudioDistortion: AudioDistortion;
    AudioEcho: AudioEcho;
    AudioEmitter: AudioEmitter;
    AudioEqualizer: AudioEqualizer;
    AudioFader: AudioFader;
    AudioFilter: AudioFilter;
    AudioFlanger: AudioFlanger;
    AudioGate: AudioGate;
    AudioLimiter: AudioLimiter;
    AudioListener: AudioListener;
    AudioPitchShifter: AudioPitchShifter;
    AudioPlayer: AudioPlayer;
    AudioRecorder: AudioRecorder;
    AudioReverb: AudioReverb;
    AudioSearchParams: AudioSearchParams;
    AudioSpeechToText: AudioSpeechToText;
    AudioTextToSpeech: AudioTextToSpeech;
    AudioTremolo: AudioTremolo;
    -- AuroraScript: AuroraScript;
    AvatarAccessoryRules: AvatarAccessoryRules;
    AvatarAnimationRules: AvatarAnimationRules;
    AvatarBodyRules: AvatarBodyRules;
    AvatarClothingRules: AvatarClothingRules;
    AvatarCollisionRules: AvatarCollisionRules;
    AvatarRules: AvatarRules;
    Backpack: Backpack;
    BallSocketConstraint: BallSocketConstraint;
    Beam: Beam;
    BillboardGui: BillboardGui;
    BindableEvent: BindableEvent;
    BindableFunction: BindableFunction;
    BlockMesh: BlockMesh;
    BloomEffect: BloomEffect;
    BlurEffect: BlurEffect;
    BodyAngularVelocity: BodyAngularVelocity;
    BodyColors: BodyColors;
    BodyForce: BodyForce;
    BodyGyro: BodyGyro;
    BodyPartDescription: BodyPartDescription;
    BodyPosition: BodyPosition;
    BodyThrust: BodyThrust;
    BodyVelocity: BodyVelocity;
    Bone: Bone;
    BoolValue: BoolValue;
    BoxHandleAdornment: BoxHandleAdornment;
    Breakpoint: Breakpoint;
    BrickColorValue: BrickColorValue;
    BubbleChatMessageProperties: BubbleChatMessageProperties;
    BuoyancySensor: BuoyancySensor;
    Camera: Camera;
    CanvasGroup: CanvasGroup;
    CFrameValue: CFrameValue;
    CharacterMesh: CharacterMesh;
    ChorusSoundEffect: ChorusSoundEffect;
    ClickDetector: ClickDetector;
    ClimbController: ClimbController;
    Clouds: Clouds;
    Color3Value: Color3Value;
    ColorCorrectionEffect: ColorCorrectionEffect;
    ColorGradingEffect: ColorGradingEffect;
    CompressorSoundEffect: CompressorSoundEffect;
    ConeHandleAdornment: ConeHandleAdornment;
    Configuration: Configuration;
    ControllerManager: ControllerManager;
    ControllerPartSensor: ControllerPartSensor;
    CornerWedgePart: CornerWedgePart;
    CurveAnimation: CurveAnimation;
    CustomLog: CustomLog;
    CylinderHandleAdornment: CylinderHandleAdornment;
    CylinderMesh: CylinderMesh;
    CylindricalConstraint: CylindricalConstraint;
    DataStoreGetOptions: DataStoreGetOptions;
    DataStoreIncrementOptions: DataStoreIncrementOptions;
    DataStoreOptions: DataStoreOptions;
    DataStoreSetOptions: DataStoreSetOptions;
    Decal: Decal;
    DepthOfFieldEffect: DepthOfFieldEffect;
    Dialog: Dialog;
    DialogChoice: DialogChoice;
    DistortionSoundEffect: DistortionSoundEffect;
    DoubleConstrainedValue: DoubleConstrainedValue;
    DragDetector: DragDetector;
    Dragger: Dragger;
    EchoSoundEffect: EchoSoundEffect;
    EqualizerSoundEffect: EqualizerSoundEffect;
    EulerRotationCurve: EulerRotationCurve;
    ExperienceInviteOptions: ExperienceInviteOptions;
    ExplorerFilter: ExplorerFilter;
    Explosion: Explosion;
    FaceControls: FaceControls;
    FileMesh: FileMesh;
    Fire: Fire;
    FlangeSoundEffect: FlangeSoundEffect;
    FloatCurve: FloatCurve;
    FloorWire: FloorWire;
    FluidForceSensor: FluidForceSensor;
    Folder: Folder;
    ForceField: ForceField;
    Frame: Frame;
    GetTextBoundsParams: GetTextBoundsParams;
    Glue: Glue;
    GroundController: GroundController;
    Handles: Handles;
    HandRigDescription: HandRigDescription;
    HapticEffect: HapticEffect;
    Hat: Hat;
    HiddenSurfaceRemovalAsset: HiddenSurfaceRemovalAsset;
    Highlight: Highlight;
    HingeConstraint: HingeConstraint;
    Hole: Hole;
    Humanoid: Humanoid;
    HumanoidController: HumanoidController;
    HumanoidDescription: HumanoidDescription;
    HumanoidRigDescription: HumanoidRigDescription;
    IKControl: IKControl;
    ImageButton: ImageButton;
    ImageHandleAdornment: ImageHandleAdornment;
    ImageLabel: ImageLabel;
    InputAction: InputAction;
    InputBinding: InputBinding;
    InputContext: InputContext;
    IntConstrainedValue: IntConstrainedValue;
    -- InternalSyncItem: InternalSyncItem;
    IntersectOperation: IntersectOperation;
    IntValue: IntValue;
    Keyframe: Keyframe;
    KeyframeMarker: KeyframeMarker;
    KeyframeSequence: KeyframeSequence;
    LinearVelocity: LinearVelocity;
    LineForce: LineForce;
    LineHandleAdornment: LineHandleAdornment;
    LocalizationTable: LocalizationTable;
    LocalScript: LocalScript;
    ManualGlue: ManualGlue;
    ManualWeld: ManualWeld;
    MarkerCurve: MarkerCurve;
    MaterialVariant: MaterialVariant;
    MeshPart: MeshPart;
    Model: Model;
    ModuleScript: ModuleScript;
    Motor: Motor;
    Motor6D: Motor6D;
    MotorFeature: MotorFeature;
    NegateOperation: NegateOperation;
    NoCollisionConstraint: NoCollisionConstraint;
    Noise: Noise;
    NumberPose: NumberPose;
    NumberValue: NumberValue;
    ObjectValue: ObjectValue;
    OperationGraph: OperationGraph;
    Pants: Pants;
    Part: Part;
    ParticleEmitter: ParticleEmitter;
    PartOperation: PartOperation;
    Path2D: Path2D;
    PathfindingLink: PathfindingLink;
    PathfindingModifier: PathfindingModifier;
    PitchShiftSoundEffect: PitchShiftSoundEffect;
    Plane: Plane;
    PlaneConstraint: PlaneConstraint;
    PluginCapabilities: PluginCapabilities;
    PointLight: PointLight;
    Pose: Pose;
    PrismaticConstraint: PrismaticConstraint;
    ProximityPrompt: ProximityPrompt;
    RayValue: RayValue;
    RelativeGui: RelativeGui;
    RemoteEvent: RemoteEvent;
    RemoteFunction: RemoteFunction;
    ReverbSoundEffect: ReverbSoundEffect;
    RigidConstraint: RigidConstraint;
    RocketPropulsion: RocketPropulsion;
    RodConstraint: RodConstraint;
    RopeConstraint: RopeConstraint;
    Rotate: Rotate;
    RotateP: RotateP;
    RotateV: RotateV;
    RotationCurve: RotationCurve;
    RTAnimationTracker: RTAnimationTracker;
    ScreenGui: ScreenGui;
    Script: Script;
    ScrollingFrame: ScrollingFrame;
    Seat: Seat;
    SelectionBox: SelectionBox;
    SelectionPartLasso: SelectionPartLasso;
    SelectionPointLasso: SelectionPointLasso;
    SelectionSphere: SelectionSphere;
    Shirt: Shirt;
    ShirtGraphic: ShirtGraphic;
    SkateboardController: SkateboardController;
    SkateboardPlatform: SkateboardPlatform;
    Sky: Sky;
    Smoke: Smoke;
    Snap: Snap;
    Sound: Sound;
    SoundGroup: SoundGroup;
    Sparkles: Sparkles;
    SpawnLocation: SpawnLocation;
    SpecialMesh: SpecialMesh;
    SphereHandleAdornment: SphereHandleAdornment;
    SpotLight: SpotLight;
    SpringConstraint: SpringConstraint;
    StarterGear: StarterGear;
    StringValue: StringValue;
    StudioAttachment: StudioAttachment;
    StudioCallout: StudioCallout;
    StyleDerive: StyleDerive;
    StyleLink: StyleLink;
    StyleQuery: StyleQuery;
    StyleRule: StyleRule;
    StyleSheet: StyleSheet;
    SunRaysEffect: SunRaysEffect;
    SurfaceAppearance: SurfaceAppearance;
    SurfaceGui: SurfaceGui;
    SurfaceLight: SurfaceLight;
    SurfaceSelection: SurfaceSelection;
    SwimController: SwimController;
    Team: Team;
    TeleportOptions: TeleportOptions;
    TerrainDetail: TerrainDetail;
    TerrainRegion: TerrainRegion;
    TextBox: TextBox;
    TextButton: TextButton;
    TextChannel: TextChannel;
    TextChatCommand: TextChatCommand;
    TextChatMessageProperties: TextChatMessageProperties;
    TextGenerator: TextGenerator;
    TextLabel: TextLabel;
    Texture: Texture;
    Tool: Tool;
    Torque: Torque;
    TorsionSpringConstraint: TorsionSpringConstraint;
    TrackerStreamAnimation: TrackerStreamAnimation;
    Trail: Trail;
    TremoloSoundEffect: TremoloSoundEffect;
    TrussPart: TrussPart;
    UIAspectRatioConstraint: UIAspectRatioConstraint;
    UICorner: UICorner;
    UIDragDetector: UIDragDetector;
    UIFlexItem: UIFlexItem;
    UIGradient: UIGradient;
    UIGridLayout: UIGridLayout;
    UIListLayout: UIListLayout;
    UIPadding: UIPadding;
    UIPageLayout: UIPageLayout;
    UIScale: UIScale;
    UISizeConstraint: UISizeConstraint;
    UIStroke: UIStroke;
    UITableLayout: UITableLayout;
    UITextSizeConstraint: UITextSizeConstraint;
    UnionOperation: UnionOperation;
    UniversalConstraint: UniversalConstraint;
    UnreliableRemoteEvent: UnreliableRemoteEvent;
    ValueCurve: ValueCurve;
    Vector3Curve: Vector3Curve;
    Vector3Value: Vector3Value;
    VectorForce: VectorForce;
    VehicleController: VehicleController;
    VehicleSeat: VehicleSeat;
    VelocityMotor: VelocityMotor;
    VideoDeviceInput: VideoDeviceInput;
    VideoDisplay: VideoDisplay;
    VideoFrame: VideoFrame;
    VideoPlayer: VideoPlayer;
    ViewportFrame: ViewportFrame;
    VisualizationMode: VisualizationMode;
    VisualizationModeCategory: VisualizationModeCategory;
    WedgePart: WedgePart;
    Weld: Weld;
    WeldConstraint: WeldConstraint;
    Wire: Wire;
    WireframeHandleAdornment: WireframeHandleAdornment;
    WorkspaceAnnotation: WorkspaceAnnotation;
    WorldModel: WorldModel;
    WrapDeformer: WrapDeformer;
    WrapLayer: WrapLayer;
    WrapTarget: WrapTarget;
    WrapTextureTransfer: WrapTextureTransfer;
}

type instance = Instance

type function querytype(selector: type)
	local str = selector:value()
	assert(typeof(str) == "string")

	local pos = 1
	local len = string.len(str)

	local function peek(n: number?)
		n = n or 0
		return string.sub(str, pos + n, pos + n)
	end

	local function consume(n: number?)
		n = n or 1
		pos = pos + n
	end

	local function skipws()
		while pos <= len and peek() == " " do
			consume()
		end
	end

	local function isident(ch: string)
		return string.match(ch, "^[%w_%-$]$") ~= nil
	end

	local function parseident()
		local start = pos
		while pos <= len and isident(peek()) do
			consume()
		end
		return string.sub(str, start, pos - 1)
	end

	local function parsequoted(): string
		local q = peek()
		assert(q == '"', "Expected quote")
		consume(1)
		local start = pos
		while pos <= len and peek() ~= q do consume(1) end
		assert(peek() == q, "Unterminated string")
		local s = string.sub(str, start, pos - 1)
		consume(1)
		return s
	end

	local function parsevalue()
		skipws()
		local char = peek()
		if char == "'" then
			error("Does not support using single quotes")
		end
		if char == '"' then
			parsequoted()
			return types.string
		end
		local word = parseident()
		if word == "true" or word == "false" then
			return types.boolean
		end
		local num = tonumber(word)
		if num ~= nil then
			return types.number
		end
		if peek() == "'" or peek() == "\"" then
			return types.string
		end
		error("Cannot serialize this value")
	end

	local function intostr(ty: type)
		if ty:is("string") then
			return "string"
		elseif ty:is("boolean") then
			return "boolean"
		elseif ty:is("number") then
			return "number"
		end
		error("Cannot serialize this type")
	end

	local function parseatom(): type
		local acc: type? = nil
		local classtype: type? = nil
		local classname = ""
		if pos <= len and isident(peek()) then
			classname = parseident()
			if classname ~= "" then
				local elem = creatableinstances:readproperty(types.singleton(classname))
				acc = elem :: type
				classtype = acc :: type
			end
		end
		while pos <= len do
			skipws()
			local ch = peek()
			if ch == "." then
				consume()
				local tag = parseident()
				local tbl = types.newtable()
				tbl:setproperty(types.singleton("$tag:" .. tag), types.boolean)
				local i = types.intersectionof(tbl, instance)
				acc = if acc then types.intersectionof(acc, i) else i
			elseif ch == "#" then
				consume()
				-- local name = parseident()
				-- local tbl = types.newtable()
				-- tbl:setproperty(types.singleton("Name"), types.singleton(name))
				acc = if acc then types.intersectionof(acc, instance) else instance
			elseif ch == "[" then
				if peek() == "$" then
					consume()
					local key = parseident()
					skipws()

					-- NOTE(marcus): People won't read the data that they know
					-- the attribute of anyways in the selector.
					-- local fn = types.newfunction()
					-- fn:setparameters({instance, types.singleton(key)})
					-- fn:setreturns({types.any})
					-- local tbl = types.newtable()
					-- tbl:setproperty(types.singleton("GetAttribute"), fn)
					-- local i = types.intersectionof(tbl, instance)
					-- acc = if acc then types.intersectionof(acc, i) else i
				else
					skipws()
					consume()
					local key = parseident()
					skipws()
					consume()
					local value = parsevalue()
					if classtype then
						if acc and acc:is("class") then
							local foundkey = false
							for k, v in acc:properties() do
								if k == types.singleton(key) then
									foundkey = true
									if v.write:is("boolean") then
										assert(
											value:is("boolean"),
											`The field {key} expects a boolean but got {intostr(value)}}`
										)
									elseif v.write:is("number") then
										assert(
											value:is("number"),
											`The field {key} expects a number but got {intostr(value)}`
										)
									elseif v.write:is("string") then
										assert(
											value:is("string"),
											`The field {key} expects a string but got {intostr(value)}}`
										)
									else
										error("Cannot serialize this type")
									end
								end
							end
							assert(foundkey, "Expected a valid key")
						end
					end
				end
				skipws()
				consume(1)

			else
				break
			end
		end
		if not acc then
			error("Expected a simple selector")
		end
		return acc
	end

	while true do
		skipws()
		if peek() == ">" then
			if peek(1) == ">" then
				consume(2)
			else
				consume(1)
			end
		else
			break
		end
	end

	local function peekop(): string?
		skipws()
		if peek() == ">" then
			if peek(1) == ">" then
				return ">>"
			else
				return ">"
			end
		elseif peek() == "," then
			return ","
		end
		return nil
	end

	local function consumeop(op: string)
		skipws()
		if op == ">>" then
			consume(2)
		elseif op == ">" or op == "," then
			consume(1)
		end
		skipws()
	end

	local OPS = {
		[">"]  = { lbp = 30, rbp = 31 },
		[">>"] = { lbp = 20, rbp = 21 },
	} :: { [string]: { lbp: number, rbp: number }}

	local function parseexpr(min_bp: number)
		local lhs = parseatom()
		while true do
			local op = peekop()
			if not op or op == "," then
				break
			end
			local info = OPS[op]
			if not info or info.lbp < min_bp then
				break
			end
			consumeop(op)
			local rhs = parseexpr(info.rbp)
			if op == ">" then
				local tbl = types.newtable()
				tbl:setproperty(types.singleton("Parent"), lhs)
				rhs = types.intersectionof(rhs, tbl)
			end
			lhs = rhs
		end
		return lhs
	end

	local function parseunion()
		local parts = { parseexpr(0) }
		while true do
			local op = peekop()
			if op ~= "," then
				break
			end
			consumeop(",")
			table.insert(parts, parseexpr(0))
		end
		if #parts == 1 then
			return parts[1]
		end
		return types.unionof(table.unpack(parts))
	end

	return parseunion()
end

local function querydescendants<T>(root: Instance, selector: T & (string | "")): { querytype<T> }
	return root:QueryDescendants(selector) :: any
end

-- local txtlabels_under_image_under_folder = querydescendants(workspace,
-- 	"Folder > ImageButton > TextLabel[Text = 'Part10'][Transparency = 1]" ::
-- 	'ImageButton[Image="1231"]'
-- )

-- for _, v in txtlabels_under_image_under_folder do
-- end

return querydescendants
