Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469569;
	b=RGcbwIe3jIoEwmivZ1NZ0vGm0eCrHRlaf+Y5yTGhZZgDNaGTcAdIkkL1LE4ijX8GTO1U
	 RHz3pJOkQXnHXLq2Rb/nJhpF/XxWTLOQqZP+TcyhwE29+5cw+0DXHeQPbJwEign8EXo6D
	 gFelHQYfszFalYVm9ynxcJZKsj5KoLv5DOH7dEg/l0kTcT3SmB3YXAiDvvZXzcnHUv5af
	 OjKpUWIxpQAd6Gu0DD/HpRW1JWJJj5BZXAdoa6cnnPMlIvTjElV8QjNCkeTfO8HQZS8Es
	 yc0bhml7OX615GnvLO2S+SmGGjuvzdPSvbSvwKDUWH1GOtGA/uM/UtTe82GxtfJ+21w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469569;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MwOPiirbdqRykgkfg4Pp0z12qRVctD+69b9g7rRiIIg=;
	b=QgqwcI77s9PEWDxwgX+HcvJZjDX8dJHUO55yiTM7mwwXbEzY4SipwMzRo6YxgBHBklfS
	 TsMYdnjgQmgVADKEZKoxR+nZLtyhq4N4NHD+Ut4ze2cx9Tz+XEeZX3cvXcSw/yzYr/bmF
	 rTUGoJ7eg1KyfvXw8t8OM3UN4BPUWA0RpbJoBvnvM+uqWjCLkk/ZKJolfQIU8mMs7fH2x
	 rea0+OVGJFzD0STZi3CkKPdG6S1GEN0OAHk5X1C5Iy8kYlNtRjXvn+/1RgtcA4q9vOoQ7
	 5y3DklrNYRh5COug9M7BmRX/ijUwdf+pU0sOTK+Z2hVqE4MN+rzJzV5WkWzyCJxUXLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=j09zaOLW;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568BD606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 21:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568BD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=j09zaOLW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795469566; x=1795728766;
	bh=MwOPiirbdqRykgkfg4Pp0z12qRVctD+69b9g7rRiIIg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j09zaOLWYKq2A04Pk2J9vkInvbagPJ4XAyEkTv7EsvT9SSaBkjL0RPz95maszIuDw
	 6fSnr+aehsi8YlbXWbytGGKhzr3Uh/O9JlNQZoaFdWU4YKGGbK89x1KOR6SPjfAsWI
	 XWucBnaFHGbg4ck6smWOUbqMjnJ3fviTOHauRZheCONQsgME3H3gpgmksXdiykZStM
	 HKYWuafLlf1iOHHWWPCmMBsZ30+5eyDbGAAPm1kDrlM7UEGaSYx8wC5bMDqGH55cit
	 6HPe6QuQB2rZ+7c5HOFvLmbxZB25Id37aCOSCDs0sHDu0WJu7eZFkdCY0rzio2iKXa
	 TRFaHIw1J9RnA==
Date: Mon, 23 Nov 2026 21:32:41 +0000
To: ribalda@chromium.org
From: Bob Summerwill <bobsummerwill@protonmail.com>
Cc: fernandezfernandezpol@gmail.com, laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
Message-ID: <20261123T213235.04d52ecc@protonmail.com>
In-Reply-To: <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
References: <20261122184500.7c9f2e1a@protonmail.com> <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
Feedback-ID: 475798:user:proton
X-Pm-Message-ID: 8e47a1b6a23c14e9901727c7dcae176cb0d8d34e
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

The app is Monologue, the default camera app of the Linux desktop I
run (Omarchy, an Arch-based distro):

  https://github.com/omacom/monologue

Qt 6 Multimedia with the FFmpeg backend, decoding the camera's MJPEG
stream.

You are right that the app should skip those frames, and upstream has
since added exactly that kind of skip, shipped in 0.3.1 -- it scans
each arriving JPEG frame for the EOI marker and drops incomplete ones
before they reach preview or the recording:

  https://github.com/omacom/monologue/pull/40

My daily-driver config also keeps nodrop=3D0, so I am artifact-free on
both layers.

One nuance on "check for V4L2_BUF_FLAG_ERROR", though: Qt Multimedia
does not surface that flag to applications. QVideoFrame carries no
corrupt/error marker, and the FFmpeg V4L2 capture path passes error
frames through unannotated, so an application using Qt cannot do the
proper check -- the app-side skip has to be a bitstream-level
heuristic. I have filed an issue documenting that gap and the
layering; the proper fix wants to happen inside Qt's V4L2/FFmpeg
backend:

  https://github.com/omacom/monologue/issues/53

The same applies to every consumer which cannot be fixed that way --
browsers reaching the camera through PipeWire, ffmpeg, CLI tools --
so for this hardware I would still argue the device-table entry with
UVC_QUIRK_DROP_STREAM_ERR is the right fix, with app-side skipping
as defense in depth.

The offer of a real out-of-tree build of the series against 7.2.15,
followed by a proper Tested-by, still stands.

Bob Summerwill

