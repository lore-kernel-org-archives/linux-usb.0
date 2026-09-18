Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A74E9C0E
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731630; cv=none; b=UToVvefbiUShffncNNoSbeH7W4mQ3Ig3SeAa/qBMrmxBORltJ01v2pxATb0i4hGftfijh4heJ4OQv07968Bxla5RGgdYw+Z63IBKCYqlqhX8ojR1C5r/CucxJLIxY2e96xNhrPR9EENGxB+pE/OM8M0QA+tHxhVBGQ3a/Wwhfes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731630; c=relaxed/simple;
	bh=VagXxzumxkfTDvvignCX0c6HspiskZgidgxAEaspEQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWZ2Vy8LCNY01W6P5e/SqN4MjGSG6IUqtjdOibGMppM4siM0lHgJF0PZaG17J6/wV1Fb1uSlTQQQv8pPfNfNIqIxxZKD9VYbr89wYx9C3HgIkR4RDIlK44XIwgXxhTaXAfPggBTSs7uZLLam/g8BD4vb61hwzs7klkVwLWQFMKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPL6lmBp; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPL6lmBp"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so4032365e9.1
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731620; x=1790336420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOm4BxoW0u80FPmTncGRhW248sy54i/iruAJYvhsmR4=;
        b=bPL6lmBp3M4XpJf7a6LJctGMqTkd82j7ajV6+6bfDp9k9GtIruR4ZMDU80s5rAOmD9
         xsK7X86efvMLWFGu3PRxacQP2knHB7JhwDbLwjMh+b5NYmXTj8axgVQQjWXAk/5x0YQj
         gT8IxV761DpVt5Vxcvb+Noc4GIdiASBeQr7tf6E6u1CYJfOmQZLZVeeWyapvu5JBnTPv
         /xIwAfTgvD4K/FTHiZhiqjJsOpJ5ZqkfuLY2f6lIdadmEqgB5yMzrwbjwCM7WXJelIWk
         7P6akf7gacy+xZ8K9M9Embi1we+vU4G4irsplj1GTD+zAqr6RRvUT7E56MkcDmTzQYp4
         r5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731620; x=1790336420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOm4BxoW0u80FPmTncGRhW248sy54i/iruAJYvhsmR4=;
        b=MeGnkP06vdQMYFo0tMPlZ0nOzjZ2s8HvvDEpgAhMQXKQZEup8UbxXZ2ubiwUVS8BQu
         RRvS8fApRevNywF8QodJCwol5hU46VMZNkelWULw8K1zN8OqIgMCE04VEuOJfNIj3C9l
         Ddkkof79AMKIj9ns1Ish5Byp2E89URrWVdaoDzqpWwQnls8m+27IQu/9M3kTA5YH53mo
         hV/Zu+oA53/Ny/MWb1kSfLSGXnwXTct7259pQWrR8yDtLbIfBRXOvlZ0MoZfgdYkFMRa
         KcSsUExzG7ErFKhczeHG2KRfZtkXmilZMeS+O4YakY1WdZZyvppwOxpzIcNaImrkns6S
         zQZw==
X-Gm-Message-State: AFuF++nNZOxdNuwWBiEjUErD/31O1W+49v8OmYrr0BnfTUTJUFROP1VJ
	8MYbT3AJCPiFCR/yu9Yucv4gr5lWNz4v2MV4VhYe8y42mdyVaHNDmt8g
X-Gm-Gg: AYBFou2HtORiXZb+QNeWdtdity4XvsV8bd+D5EIp2mdbP8Vy3VNN+iGjXbN8vHQuM35
	iyWwjmRXheNMz3gqjIfS5Umad95aD3pqOianv0JKmaYx7CbtjtLjGo5RoadNCHy8FfrinyJGvj8
	eKj/H2dhTcZhELKw4OvXk+oiOGcAU4r9sRya4GqABzJbmEqpXeafUpDHuDNH8BmkUtv+7CgMbQ3
	eJw77yytdplyV3mb56xRG9IwAvP0hwmTecv+xIjpnEc+oWfaDdXd2ObRwn45H6nmWtxX3Zj2OIa
	Q/cjczSFxdJTViyBIYraKiYqAszv3pbhkPaO/dIEDqNHNRwDlupbAfIm/QzFZwPVbaP5Tg8bfqt
	9miYlUqXbqZ1tvsZyQHF0Ly9WY2+M6kX9LfEZftxf7035e2yJW1U0jc5cWYYQna8CeE/7tSimD/
	4mlG9fnQogluL/aTxVUr4n8ER+VSsOnRRP9eB+yTP6l6sugt6CmUMFJefhFFGjZslq6SugCJhST
	iM/nz5jBK1ALtFfNEYhtsi+kBI=
X-Received: by 2002:a05:600c:354c:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49fc568f76dmr26830865e9.9.1789731619917;
        Fri, 18 Sep 2026 04:40:19 -0700 (PDT)
Received: from cachyos ([41.143.99.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm3734893f8f.5.2026.09.18.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:40:19 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v5 8/8] Documentation: sound: add the Babyface Pro proprietary-mode design doc
Date: Fri, 18 Sep 2026 12:39:44 +0100
Message-ID: <20260918113944.76871-9-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113944.76871-1-i.bahloul01@gmail.com>
References: <20260918113944.76871-1-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A big-picture companion to the patch series, for human reviewers:
why the proprietary mode needs a standalone driver instead of a
snd-usb-audio quirk, the vendor protocol's write-only/no-readback
shape and what that forces onto the driver, the asynchronous stream
model, why the mixer state has to be cached and replayed, and why
the driver has to emulate TotalMix's own role for the front panel.

Requested by Takashi Iwai's v4 review: documentation for reviewers,
not restating what the code comments already say inline.

Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 Documentation/sound/cards/babyface-pro.rst | 163 +++++++++++++++++++++
 Documentation/sound/cards/index.rst        |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 Documentation/sound/cards/babyface-pro.rst

diff --git a/Documentation/sound/cards/babyface-pro.rst b/Documentation/sound/cards/babyface-pro.rst
new file mode 100644
index 000000000..d67f8c6fe
--- /dev/null
+++ b/Documentation/sound/cards/babyface-pro.rst
@@ -0,0 +1,163 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================================
+RME Babyface Pro / Pro FS (snd-usb-babyface-pro)
+=================================================
+
+This document describes the design of the ``snd-usb-babyface-pro``
+driver for reviewers who need the big picture before reading the
+patches - what problem the driver solves, why it is a standalone
+driver instead of a snd-usb-audio quirk, and the four design
+decisions (stream model, protocol shape, mixer-state persistence,
+front-panel emulation) that shape most of the code.  The patch series
+itself is split by feature (core+PCM, then masters+crosspoint,
+preamp, routing flags, suspend/resume, front panel, DSP EQ, in that
+order) so each patch can be read and built on its own; this document
+does not repeat what each patch's own commit message already covers.
+
+Two USB personalities, one device
+==================================
+
+The RME Babyface Pro and Babyface Pro FS present two different USB
+configurations depending on a physical/firmware switch: a
+class-compliant one, already handled by ``snd-usb-audio``, and a
+proprietary one (USB ID ``2a39:3fc0``) that this driver covers.  The
+two hardware models share the same USB ID, ``bcdDevice`` and
+``iProduct`` string shape; nothing in the descriptors tells them
+apart, and the driver runs unmodified on both.
+
+In proprietary mode, interface 5 carries the PCM stream on two
+INTERRUPT endpoints (``0x01`` OUT, ``0x82`` IN) instead of the
+isochronous endpoints the USB Audio Class specifies.  Isochronous
+transfers are rejected there with ``-EINVAL``.  ``snd-usb-audio`` has
+no interrupt-PCM transport, so this mode cannot be a quirk on top of
+it; the driver is standalone, modelled on ``snd-usb-caiaq`` (another
+interrupt-streaming RME/NI-style device).
+
+Why interrupt endpoints and not isochronous is a hardware/firmware
+choice on RME's side, not something this driver can change - the
+class-compliant mode already exists on the same device for users who
+want a fully standard, quirk-free path with a subset of the
+functionality (no mixer, no front panel).  This driver is for users
+who want the full mixer, routing matrix, and hardware DSP EQ that
+only the proprietary mode exposes.
+
+The vendor protocol: writes only, no readback
+==============================================
+
+Every mixer and clock function is one of a handful of USB vendor
+control requests (``bmRequestType 0x40``, i.e. host-to-device,
+vendor, device-recipient), each identified by its request number and
+a 16-bit value/index pair - there is no larger command structure.
+The commonly used ones are:
+
+======  ========================================
+0x10    settings word / stream start trigger
+0x12    16-bit crosspoint and output-master writes
+0x16    cold-init register clear
+0x17    front-panel + preamp state (read and write)
+0x1a    8-bit gain / output-master companion writes
+0x1b    clock DDS quads (base rate and varispeed)
+======  ========================================
+
+The full register map, decoded from Windows USB captures and
+cross-checked against hardware, lives in the driver's own development
+repository (not shipped in-tree) - the constants and the comments
+next to each vendor write in the source are the authoritative
+in-tree reference.
+
+The one property that shapes the rest of the driver: **almost nothing
+here is readable back**.  The 0x17 request returns the front-panel
+and preamp state, but the crosspoint matrix, the output masters, the
+routing flags and the clock all have to be tracked host-side - the
+device will accept a write blindly and never confirm what it actually
+holds.  Two consequences follow directly from this:
+
+* The ``struct snd_usb_babyface`` device state (see
+  ``babyface.h``) is not a cache in the usual sense of "avoid a
+  slow read" - it is the *only* record of what the hardware should
+  currently hold.  Every mixer control's ``.get`` callback reads this
+  state directly; none of them ever talks to the device.
+
+* A full reset of the device's registers - which happens on every
+  cold init - has to be followed by replaying the *entire* cached
+  state back, in the right order, or the card comes back silent or at
+  the wrong levels.  This is what ``babyface_restore_state()`` and
+  ``bf_state_apply_flags()`` do (see "Mixer-state persistence" below).
+
+The asynchronous stream model
+==============================
+
+The PCM stream is not started or stopped directly by
+``.trigger()``.  Instead, ``.trigger()`` only adjusts a shared
+``stream_users`` counter (0..2, one per running substream - playback
+and capture share one physical stream) and schedules
+``stream_work``, a work item that runs in process context because
+starting a session means sleeping USB control transfers
+(cold init, the session-arm sequence) followed by submitting the
+interrupt URBs:
+
+* **users 0 -> 1** (first substream starts): cold-init the device,
+  send the session-start trigger pair, submit the IN/OUT URBs (always
+  as a matched pair - the device does not advance the stream unless
+  both directions have a pending transfer), arm the session, then
+  replay the entire cached mixer state (masters, crosspoints, preamp,
+  flags, pitch) since cold-init just wiped it.
+
+* **users 1 -> 0** (last substream stops): kill the URBs and let the
+  session go idle.
+
+So the device always has exactly one live session regardless of how
+many ALSA substreams are open, and a rate or format change on one
+substream transparently restarts that shared session under the other
+one - the other side sees a brief rate step (PipeWire's resampler
+absorbs it) rather than the ``open()`` failing with ``-EBUSY``.
+
+Mixer-state persistence across re-probes
+==========================================
+
+A userspace client can claim the proprietary interface directly via
+``usbfs`` (``USBDEVFS_DISCONNECT_CLAIM``) - both PipeWire grabbing the
+device for a sink and the project's own TuxMix userspace daemon do
+this via libusb.  That detaches the kernel driver and the ALSA card
+disappears for the duration; when the client releases the interface,
+the driver re-probes.  The device keeps its register contents across
+this detach, but the driver's own cold-init (required at every
+session start, see above) clears them - so the driver saves the
+in-memory mixer state at ``disconnect()`` and restores it at the next
+``probe()``, keyed by the device's USB serial number (or its sysfs
+path, if it has no serial) so the same physical unit gets its state
+back across the cycle.  The same state is also what a system-suspend
+resume replays, since the device loses its registers across a suspend
+the same way.
+
+Front-panel emulation: the driver plays TotalMix's role
+==========================================================
+
+The front panel (IN/OUT/SET/MIX/SELECT/DIM buttons, the rotary
+wheel) has no on-device intelligence of its own for turning a wheel
+click into a mixer change - on Windows/Mac, RME's TotalMix
+application polls the same 0x17 status register this driver polls,
+decodes button/wheel deltas, and performs the resulting mixer writes
+itself.  Standalone (no host software) mode exists on the hardware,
+but the proprietary USB mode this driver targets always has a host
+attached, so this driver has to do what TotalMix does: poll 0x17 on
+a delayed work item (``panel_poll_ms`` module parameter, default
+20 ms to match TotalMix's own ~50 Hz), decode the button flash and
+signed wheel delta, and apply the resulting change (an output fader
+step, a preamp gain step, a phantom toggle, DIM) exactly like the
+corresponding ALSA control's ``.put`` would.  The front-panel ALSA
+controls this driver exposes are the read side of this: a way for
+userspace (WirePlumber, TuxMix) to observe what the physical panel is
+doing, not a way to drive the hardware.
+
+Some panel state - which channel SELECT currently has chosen, for
+instance - is not part of the 0x17 readback at all and exists only on
+the device's own internal state machine, which the driver cannot
+read.  That state is tracked host-side and deliberately re-synced to
+a known value (nothing selected) for the first few seconds after
+probe, because a stale alsactl-restored value would otherwise
+silently desync from the physical LEDs.  The relevant code comments
+(``babyface_panel_start()``, the ``panel_select_armed`` handling in
+``bf_panel_tick()``) explain the specific desync scenarios this
+guards against.
diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
index e68bbb13c..31051b7a4 100644
--- a/Documentation/sound/cards/index.rst
+++ b/Documentation/sound/cards/index.rst
@@ -12,6 +12,7 @@ Card-Specific Information
    emu10k1-jack
    via82xx-mixer
    audiophile-usb
+   babyface-pro
    mixart
    bt87x
    maya44
-- 
2.55.0

