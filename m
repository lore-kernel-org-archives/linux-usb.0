Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688598;
	b=d1t6oeJlrgH2/FauxzvjEpEKb37HYBIUQWUgU5+N8oTs25IkzkVk0Y4obB2IQoQJ6x9b
	 N3DBG+MsnsqEh4oJ6pfK++L5xzLk5Fr8JqEnveOIRiL1xJltv+Y8LEz1AcVTvRGA07XF7
	 znE7bjI3j4MyYiJA8FmjliIxMNMRWwGlxqSeVkrgdSbspYBPpgpnHO4GuOI6/sdBJkdt4
	 n1mS/jyIz9oADrJ5BhlEKIa73m6zayBVmOwlAq/614JC2UwKBDkTpmyWdBi2ar8XuZgi4
	 7ifM+LsWUnKHIIJcPC21wagYcHA2YlkcEHQsSFgV8CqCacbpuWbBc5fCmhu0FN9SwUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
	b=Ayq28UNLVS6hCKnjS6KGzf5oW9jOR8ZKHArBkDeKr7OjdaZAkdr3kAfR7EgiT6XmhFqq
	 g8KCCGYyAXKSsWjsKyi3XIDKGtsBqnbjY6aurDnUsLwlSJD9xE2jaFKnVumaXhx44JChF
	 XduYNtKje92BOgmZJ7xjQecdP0L4kmAxuNhUwfHo7G7xPyQ8rBTEDFXO/MSb61o8wGjcL
	 6YrcEbDE4MT1rXzxz3gj2v44TsgVJfr8l4uEGTiVEzDo+yOItniLIrb1rP+Wcz1C+Hb9/
	 Hx/CWM04yesH8wItZEXl6MsIWBolnNtw7vYJuHsXtmyQF0Gf9k18PLBLbysbHX/mJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUWUwqh1;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2052606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2052606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUWUwqh1
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b40b3772f0so822648a91.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 02:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688597; x=1796293397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
        b=lUWUwqh1//I1+LAJzb4Bzn8jaKQ3owOuo2IGg6EQUm0jdSwW2IJmNpwQ0Iwm1G2Hfk
         KiIc887qpbEOK8lGwHWOA3GWhF4eNtK8vY+JsO1KzKgcrZR8NXpdwJJBUSy+lLG6jkp6
         6vArsjUBS/AvDvOSnKKZGgWamlXZoGUrEl2T0B6ZP2LlfA58F+qfqLkajUmgvKxPaB1Q
         jMkaX5+Rq4h6jcOtLqK0P6HQTW5wYMn1amgUD5YgVy5d+kmU7WfmjDHADxh7rEP+G/47
         /lMCJhFLuO+cj0hKGvQTYrLIzCXfebdF5Kz72NPUf/Qik/lf1cKsj32v8CcxmSWeZoFs
         PIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688597; x=1796293397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
        b=FOaPZdjHz4fCIxGwVbn1Mtk8J6cx2BDGDTLxf+2wwEdr91u/zkY2DHETvsHZW6tl/D
         xwDLUVMwmIBKnIwT2O02YntMZ+qc5BhDZnqMRBb3dcKPCkFXF89S7u14C64VMLV6f+fN
         AEbZQx5OhdxY1zWwe79YCu+oD8+WWCRHPFlo1HJujmtengVtnlP96qlNfa+fzEzod2M6
         0cmCwv0N+HHCnqFf3FTgc++//uRoUABT2AMBT0Zrn4Dr//qE5zJ6+jdLtk1f4s5E4C6C
         U9fYxXclBWPOKFOQS8BdrFgnS3tUykLlvjQH4+uMcu3ZlexKuhj5iz6gWAw+Bnu/v9/6
         Yz6w==
X-Forwarded-Encrypted: i=1; AL+hErEln5m3PREkOxKHTVqIBqSFHRSBw+HIrPW+jo17zk7B9lSzebwnQsqLdbOM52s/q8XFP2feb4gZtX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8548vuofQ9qj5wf6yMNZH9SOtFkI4DlOcP8/14fffXlkgJ7aOQ
	VOUR4HvgJ6FHwLih8L11aMlzAmRvlgLxxFLb1X+N103bVElmq1LyrQ7c0UmcDMx+
X-Gm-Gg: AZFdTZeHScmXCqY438kmaPF3pwH2VZ6EPaPQmslBmLOr3VMlwAuLQjCZoFba4nWgdsS
	DvnUbJjsjox+Sz7xnMUPezE0003kE7hTTDd0Ue53yN43ia1nc8GRH7T6w586utQhjnyv1I2bEZb
	MFzhPNJDvgFwqOUHwUgiYdfiAfdqM/qiQ76V0qchiLg+hCZHPRWWpdEYBU8MFb3ycnT29J4W04y
	aLQeGMxWGAEkbKvr3DPg9OMHt1lGCD+QIyazM1WCweGB8vinfkaoWbXThiRaa++NUL5WL+9UXO4
	JHa3NyV0eriEPp6vEsX+HD0/vevdQg58PN+pg0DkQjWamxNOVK3qH/YWqQL/s67hu+THRnV8KKR
	RDUqirI/RJBKp6OmPWlURGQx6gC8S6eAVYPRQ6RId7DpfcQNAkhQcqw27sd9sNJURfpMe0R5tkG
	ItCPManxPw3IwuAm9MOzHsX+a9GuU6l0PnN9KgX1KEEtQOTa33o1eBaHHozQyAVTQB2FyuEk4ox
	Ph6N2I32BN2h6G1VQD7VVQZTYoBGo8YdX5k04QEoERNPYIVg0PuzIJZ7BHbSVicchb2sT+u38pi
	kHWJkkjNawve90E7o+/KqihgQZ7dlEBrHKaWiVdW2XyHtzBX4blo9JD8J+L6V9hG7DWfI0evG53
	Z6FFRF/vRCymh
X-Received: by 2002:a17:90b:498c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b41c55b914mr29450973a91.0.1795688596883;
        Thu, 26 Nov 2026 02:23:16 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm10758422a12.7.2026.11.26.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:23:16 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vadim Yuzifovich <vadim@yuzi.co>
Cc: gregkh@linuxfoundation.org,
	thinhnguyen@synopsys.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Thu, 26 Nov 2026 18:23:06 +0800
Message-ID: <20261126102309.859777-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070433.2813951-1-vadim@yuzi.co>
References: 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vadim,

I tested v2 on a Milk-V Duo 256M (SG2002), on top of 65e4fd942f72
(v7.4-rc3-406), with "p->g_dma = false;" removed from
dwc2_set_cv1800_params() and dr_mode set to "peripheral" in the board
DTS. The params file in debugfs shows g_dma 1 and g_dma_desc 1. The
gadget is a configfs composite of ECM, mass storage (a 16 MiB file) and
UAC1 with req_number 8, on an x86 host with xHCI, high speed.

Three kernels: A without the series, B with patches 1 and 2, C with all
three. On each:

- iperf3 over ECM, 60 s in each direction
- dd of the whole LUN with O_DIRECT, one write and 20 reads
- sg_turs -n 200000 on the LUN, while the board copies a 32 MiB file
  in tmpfs to /dev/null in a loop
- speaker-test playing a 440 Hz sine into UAC1 for 5 minutes. After
  30 s the board writes a 120-character KERN_ERR line to /dev/kmsg
  every 2 s, so each line goes out on the 115200 baud serial console,
  about 10 ms like the hold in your test.

                        A           B           C
  iperf3 in/out Mbit/s  138/94.9    149/97.9    142/95.9
  dd write/read MB/s    6.6/18.8    5.8/23.6    8.9/23.5
  sg_turs per second    3432        3279        3359
  UAC1 runs wedged      3 of 4      0 of 2      0 of 1

iperf3 is host to board / board to host. No retransmits, no sg_turs
errors and no dd errors on any kernel.

On A, two runs wedged within about 45 s of playback with the console
lines: speaker-test failed with -EBADFD and the host reset the port.
The third went through the 5 minutes and wedged when playback stopped.
The SET_INTERFACE to alt 0 timed out on the host (-110), and at the
port reset the board logged

  dwc2_hsotg_ep_stop_xfr: timeout GINTSTS.GOUTNAKEFF
  dwc2_hsotg_ep_stop_xfr: timeout DOEPCTL.EPDisable

after which the host could not enumerate the device again. Rebinding the
UDC on the board failed; only a reboot recovered it. This looks like
what you describe for patch 1, EP0 not answering after the stall, but I
cannot show the BNA itself: on A it is dev_dbg and my config has no
CONFIG_DYNAMIC_DEBUG, so the link to BNA is from the symptoms only.

On B and C no run wedged. After the console lines, arecord on the board
captured the sine, and after playback stopped the gadget was still
configured with no port reset.

On C I also ran everything together for 30 minutes: the sine, the
console lines, the copy loop, iperf3 -R for 1800 s and sg_turs
9 x 200000. iperf3 moved 11.0 GB at 52.3 Mbit/s on average with no
retransmits, sg_turs had no errors, and
the host logged no reset. Afterwards arecord on the board still
captured the sine.

The "BNA, DxEPINT" warning from patch 2 did not appear on B or C, and A
showed no bulk errors either. My copy loop is much lighter than your
H.264 encode, so patches 2 and 3 ran here without being exercised; for
those this shows only that nothing regressed. The UAC1 counts are also
small, 4, 2 and 1 runs plus the 30 minutes.

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M

Thanks,
Chen-Yu
