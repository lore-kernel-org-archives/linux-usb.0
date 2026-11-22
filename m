Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391918;
	b=bwtWIgMx/GeOIe3ZUxKVmPcP9tZ1PGtWvJVxXZg8p5oY57TMnhTrvgXTteSQEkj6T/z5
	 afusF3mD6rjr0klcXYKOz3Za1h7manU81JMlMFo76x1Pl/HaAw6zeteUkwKr+MfhjbJHf
	 K3M0gRcOxp6/pAhf05gpN1e4od4yMXYVbpKOzCTDTig0gsJGFRMA6iWuNMFgB7TZgpdhL
	 15pNPctyOGg71+QamdJE0ily8Pb7AEjOE2X6XrAHHJOXxv862NG+9wn/GcyYMjvkfYZRF
	 6ZbGnuO6QABy8vAAgkV5ftxk5U3N0kDIl6dybCXC5J20OX/RmkRBBRgFwGXQUIxbh3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391918;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4gNy8roLwOc1L+J3BtP1HrH6hRU3IEez5wKIQNQ7iSM=;
	b=2OYfUIkEI5Ddcqevc+bos9+czDj+J2LIpBaAax+GC18ughjFQJA7zav1AXHimGxRJc8A
	 00JcELj4v5VekGU1FUp5GqKln1Rv3GJN7Ag+R/SLuE7CutxmTYi/nQd9LaiCn8uMiVq3a
	 jWL6gTIKTGidiztKhOdIyz/dQtbS+SpMLmkXVnXQhevYSix1TCFjB4stgTxOkHK2PE1yT
	 JRjCr6tc1Zx7igw2xnFh5eExgUfFViOvUY1LMf0GdenPtuoG1u+edknODLXaVjmgYmFrx
	 LxQ+Zi9OWwdeyiwwS1gDGbU40+pLPK+2Uzs5FJ0TSPoj6nwA7M4DVEr3JHj5zbdR5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Tcf8RxQ8;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22399606A31E;
	Sun, 22 Nov 2026 23:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22399606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Tcf8RxQ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795391915; x=1795651115;
	bh=4gNy8roLwOc1L+J3BtP1HrH6hRU3IEez5wKIQNQ7iSM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Tcf8RxQ81NeFVPWjqoCo0gU05OmsowWNPtGHfubmin1MpzGGAXX7z1A37MRTsv6bP
	 bAi48j7vteg4IjZlszEJv3/gdXIyo9kW55a/zsTxJ6idxvOoIDLFQya0unjbL1g1rN
	 LTakutNajavIJdFfJrchVpYraKp/ArE9QNkVLcW7wBzb3z1gs8QDnrGNoljAsXYWsH
	 P40EOjv1QzCZZRST4HWzKDp5yfP0bB3nic60dbtlph1qPULnKQzIiWB7gqod8AoL3a
	 QaAJCLHF+UcvulQfYoq5W12EelQVPHnPCr3tnG3wQIbxnJCu5xUa+lLj+N173rrK30
	 BZdaoBQU5zGOg==
Date: Sun, 22 Nov 2026 23:58:33 +0000
To: fernandezfernandezpol@gmail.com
From: Bob Summerwill <bobsummerwill@protonmail.com>
Cc: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
Message-ID: <20261122184500.7c9f2e1a@protonmail.com>
Feedback-ID: 475798:user:proton
X-Pm-Message-ID: f05ee7a42ad6d3b376f96f1df81ab75ef3e4ea2e
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

Hi,

Field confirmation of this series' diagnosis from a stock, unpatched
kernel, in case it is useful when considering the patches.

Device: Logitech HD Pro Webcam C920, 046d:08e5, bcdDevice 0.21,
directly connected on USB 2.0 (no hub).

Kernel: 7.2.15 (Arch "linux-omarchy" build). The camera has no
device-table entry here, so it rides the generic UVC catch-all and
uvc_no_drop_param is at its default of 1 (deliver error frames).

Behaviour matches the commit message exactly: intermittent gray
bands over the picture in applications using strict JPEG decoding.
Setting the module parameter nodrop=3D0 -- the global equivalent of
this series' UVC_QUIRK_DROP_STREAM_ERR -- makes the artifacts
disappear entirely. With it in place, 300-frame MJPEG captures at
both 1280x720 and 1920x1080 sustain ~27 fps, with per-frame mean
luminance stable to within 1/255 across the burst. The camera has
been in daily use since, artifact-free.

To be explicit: this is confirmation of the failure mode and of the
workaround on the affected hardware, not a Tested-by for the series
itself -- I have not built these patches. I am happy to do a real
out-of-tree build against 7.2.15 and follow up with a proper
Tested-by if that would help the series along.

Bob Summerwill

