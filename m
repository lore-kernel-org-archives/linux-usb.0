Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05483C0A00
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161969; cv=none; b=YpziKsgkNHKnehaJd7ezH/oBAy04w12dgn41L8dVq3M7o0ovjnQPxmSRW95USRLXFWtdUqick2rDblzHd99P7MTDijB8FiyRQmvRRLwCUslhOQeXtmYnqsJC/sWs146gUvCLzLASCLCeCe7yHN5Cy8QuXIo5lyGSyajuWHKn2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161969; c=relaxed/simple;
	bh=QrTJWE70DBGnSIQzN+D38jTEduyNbCqVrj3Zsj9gnJY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gY0EEOb83C2bqP/01hioYgtF3Y+7OqpIQ3hSpg5heF7gV0dcUWs06TlYr+6yfnaivgFGbqSU5cqyhF5HR6FA4Lj5BwqGaTVOb2OFJRigYpGkF4VO7+YgBDWSE7Jek/eVJnN5PFdMZFTFnsVNui91k4blcdgQHdDIe6mTvxbdqhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T62XaULF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T62XaULF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so120222f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788161966; x=1788766766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R4S/9+jlufzba7F6gcc3PdCmD+gEBW2Mjb6Bdoi7x9I=;
        b=T62XaULFvhaBloLCVm0eiY6BNCjqPTK/E61gePsEhxBw9Vw2Mk4EnA2Rpz9QjGx12F
         zeEiUWAB/7IrB+a2zavNmHXjDXJ4awZH2kvUdZ+eI983ukQBK+tEqnTgXkrgNRBy/Emy
         7EwUgrCmHLnA0UyBoXMhzqpMDVGI8ncq0/Y5ZqZILwtM8wBg0nWHMgi7JF53Z3U4YUik
         tx7fW74W1d+xITQd7XakshKJGu9mzSJUSlQcpxGjy2E33Jz2t6z8Yt7FmFK2ImZlHrZw
         c1UrQ2UVqyasqknU0WWJ6rt8x75JK5e658USyYh7l2jvzDSY52Yb9v4h74Hxa3q89KHl
         v5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161966; x=1788766766;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4S/9+jlufzba7F6gcc3PdCmD+gEBW2Mjb6Bdoi7x9I=;
        b=dly0kpSHjIi1a5WhM8nYabV9np8xiXdlYGqPImlU7ULjEuAgleeA01wHVSFagz+vHD
         +s/H5YDas+rTRatULcp11HAhF/YnmKxJKqNkvxiwnIID8FaFT54s2nk/K81AvKyG6V0R
         4fYj0Oca544mt5NGGWKw1+lcnehrnFAdyoYgwfHxfqrYujoxPW5WIcNXMqEKAPFLgxWr
         IdKMaIs8VxMpw00d9HQwgKxTNuu+q3V6MS9daSBL7okBgEvo9fLQTt5pFK86L2MED2pc
         9Spp+c+kQ2UXRhR5Rh1Eh4GNelZ68r9qNAKEDWY8z3pcFmDfHdqsm5UR7ZsnpXqcpOty
         l4Mw==
X-Forwarded-Encrypted: i=1; AHgh+Ro88nvPi2lSMoHPIW2zeG5lyOtojloqNe7EKV6IClwtN7kuiN316q0g+aVy9jFJDJ7hpGiOLxI/tIk=@vger.kernel.org
X-Gm-Message-State: AFuF++kLcmOLR9qNuov6OKgg63feLWdjx5o4aqn3WP5kU6ELGxzQGmKJ
	lnrD8A9QAEFXV9vKWUzwwI+312na+6sKbsVVR/BN86VFqQBUATueWU2u
X-Gm-Gg: AR+sD130uTU6T28hH00HVHjheAfMSAY4o9hkz+Gywsii7CGD8FApFgcU4edpCBga2Ow
	oa8/JY8x4LJ6001ugguPnO6iu2ta5TC6DZ2y4eWiaQD9ZGb5k40uGrQUmT5+3mz1tDHxMvkqY8y
	dlOMWKbq2N/C7sv7uUqCSkRqCdhEU087KAMi4zp5ilR8hUF6Yhyyq5+tIfmOrjL8Suum6eBlQTM
	D9HKvxF5KloTIsSRVdOuuKsg8SN8no51LoBSNlFLADgdFOiepzAOEmyNvaOt+nGrC3Bm2sWbYn7
	6SN9a9nR/lK1EbYd8f8UyeyBQLE6jAgzz5xGGbbFjZS+hscRkZo7EXFmVlu3u68gtZwMWBr1RxJ
	qVh8HcdZg61dShV3sMr+VXEU6/g1E32C+WqjPk8SPBkP8Y8NclEbSMwTNXtfrbw5AcRlfeBCv9H
	i30E6nT9+WAsukDqP7oIp8Iqnt3GIX4yUmbxKw+gkBZG84NNtrD/rMdZmpBIkWkD9UApY=
X-Received: by 2002:a05:600c:620e:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49cc0d4545emr288693555e9.14.1788161965724;
        Mon, 31 Aug 2026 00:39:25 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm142974595e9.3.2026.08.31.00.39.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 31 Aug 2026 00:39:24 -0700 (PDT)
Date: Mon, 31 Aug 2026 09:39:14 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP
 (0x83) loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
Message-ID: <20260831093914.7e8a45d6.michal.pecio@gmail.com>
In-Reply-To: <50990d6b-575e-4548-ae3b-4f58df00d284@yandex.ru>
References: <1551785954451@mail.yandex.ru>
	<20260815215259.014cc324.michal.pecio@gmail.com>
	<fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
	<20260818000909.31af0ae3.michal.pecio@gmail.com>
	<358afe43-5f0f-41f6-89cc-129b20ef7641@yandex.ru>
	<20260818232945.2c67b15b.michal.pecio@gmail.com>
	<f4eb5fa3-3c91-4c7c-b709-b493a0563e66@linux.intel.com>
	<cd7e86de-f7e6-4cff-b171-24891ef30bd3@yandex.ru>
	<20260822092541.1bcc6dae.michal.pecio@gmail.com>
	<0ea518e1-8f64-4b35-8e0f-fc8ec0463491@yandex.ru>
	<20260822104435.1061f367.michal.pecio@gmail.com>
	<50990d6b-575e-4548-ae3b-4f58df00d284@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 23 Aug 2026 23:10:26 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=
=B9 wrote:
> I temporarily reloaded uvcvideo with quirks=3D0x80. The selected
> streaming configuration changed from altsetting 7 with 3072 B/frame
> to the following power-of-two configuration:
>=20
> Device requested 1024 B/frame bandwidth
> Selecting alternate setting 3 (1024 B/frame bandwidth)
> Allocated 5 URB buffers of 32x1024 bytes each
>=20
> Without dynamic debugging, one 300-buffer run completed with rc=3D0:
>=20
> duration: 17.941 seconds
> delivered buffers: 300
> reported sequence gaps: 217
> effective delivered rate: 16.72 fps
> delivered positions: 58.03%

Not sure what's "sequence gaps"?

> A five-second xHCI tracepoint capture contained 39,136 queued
> isochronous TRBs. All of them had this layout:
>=20
> length=3D1024 td_size=3D0 tbc=3D0 tlbpc=3D0
>=20
> There were no 3072-byte isochronous TRBs. The same trace interval
> contained 339 Missed Service Error events.

I suppose that's correct for a 1KB high-speed endpoint, but errors are
still there. Looking at the trace, they come in bursts of three.

The first one has non-zero TRB pointer and also "len 1012", which is
practically guaranteed to be bogus, as it doesn't seem packet-aligned,
so receiving 12 bytes should complete the TRB right there.

Not sure if the garbage data affect uvcvideo or if it is only bothered
by the -EXDEV status. I suppose this would hide the garbage:

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2421,7 +2421,7 @@ static void process_isoc_td(struct xhci_hcd *xhci, st=
ruct xhci_virt_ep *ep,
 		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		frame->status =3D -EXDEV;
-		sum_trbs_for_length =3D true;
+		requested =3D 0;
 		if (ep_trb !=3D td->end_trb)
 			td->error_mid_td =3D true;
 		break;

Curiously, the errors always seem to happen during runs of Short Packet
with len 1012, which means the camera is just returning a 12 byte UVC
header and not sending anything meaningful. In theory, it might perhaps
be recoverable at UVC layer with some heuristics. But I don't know if
that's what Windows is doing, or if it simply avoids having MS errors
in the first place.

There seems to be no issue with submission timing, the TDs which are
missed have been submitted 17ms earlier. Besides, they are ASAP.

It could be some power management issue. Any chance it goes away if you
add CPU load, or memory load like memtester or stress/stress-ng with
appropriate options? Some recent AMD systems seemed to need that, IIRC
no one found a proper solution yet. There was some discussion about
setting latency tolerance, seems no one actually tried it.

Regards,
Michal
