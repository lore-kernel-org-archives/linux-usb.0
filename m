Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713635;
	b=NtUCrm4JK71pK1WGyLs7yKkuceW2M4R7vOcVOjc+HDm9gQTzHCnE/sc3LjfAhlurL+fq
	 m+T6dpST9cfA6rPazNOFGFcaVIAdnnL7CkToytMm7oDnrFPcpWjgf8ThLepPRmA41B2Bn
	 IDyE7oav5DCiOMzUSaEY3cVkglwQ4E6OfZtgXPMT51RYQWaxaBFugLICwpImvGUWAYWNI
	 7jet+UyOnc9+Ao4f4I3WRy0zZYkZuc+bfF+1Ux7do+lwAznAxdcuv2WRWf408z5kqof+F
	 wXhcC3V//FdhmMdaORrjijRGEshhZ1qCbtTl0sRYLCHhXDCPuQJq2AsvNgSGZY3u0yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
	b=DBFRmJg2GguYNIBxvZ4CZfJfXF1sTjPNrfjABKOzIQ+OU1jjHwVhz2rFCMb4by9GVNdL
	 SnNSFL56WyYnOWGE1pycSNyyX68fskbOkDY4t49vNAeXgb6YNCqKupVi0j4Fcf/qCnwpP
	 weZp9477OQbLLJ/WkypkIjveBXopNxEs2jSWpWKobjIMkQFFPJIEoSigwmy6f/pgl0Z6S
	 9UB36yDZWJwyHRuqlkGdHUOj5txJD6Uiza85BUcysUDBV5zV7vPWALKBFztiDyk3hQxeM
	 6JFFT2FHa4UwcMiBlfxuoffv63gytSBqQUnYPRd7F7MJ9Q3kUbMiOJhSH8zBhtALEFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="MS/nCF09";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B64606A32E
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 13:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B64606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MS/nCF09
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea7987517aso27291235ad.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793713634; x=1794318434; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
        b=MS/nCF09Kaepy8l4amk1AQkeG3JDeFVFiR75xOhgb/2YUD0I64nG1hnAmPHtaRI9KL
         +12xegRgpBfgYCJdMNqlmMssuRfjcQSMvIfWtLsVW0pwT77LnFGz34MPXkvI7Ex/emG+
         J1Ge9yVaF6ICQLHwVOAuUiFxs/pxHXlDYaFPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713634; x=1794318434;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
        b=Cm6KtpCUtaETxlemnmPSgnK2io1ciAIfL/eNf+tH18VtxrMkU+qL3NeaDGxe7kFNdl
         WMCvdnxH5hLeJo922XQYbLrycg3biukXZ3p9IXil32WSIvmWOJYYBJ5tDTgeKiWZzZu0
         FvNtk7PcrKqZSnjpxnvXFdKsJeXFvprxmSt8ha0qxYQc5d3QlYR+tPZIjiXJelLNdJBx
         +mdY5dlitcNqg/4zu1zN84DImE3j6tIsLgus0FPCzWSaLlefG2LABfNAXUBwUG5VBq+W
         DEC3a39Nh8EfkIvRF2na85hHUqH32NotSTDHV/UIwpjvUBoSJyrsK4G9RNK82UTMCl9O
         nmbw==
X-Forwarded-Encrypted: i=1; AKwUvBxReQbNu7fIwfejvb2fKDoeFFaS6q+3UlPF+l5M/cawMJ8Tqj+0IwjSeWpubJVkd9VA2u3KTadg2UY=@vger.kernel.org
X-Gm-Message-State: APuU4Z95mlA74bNNtyw8ARF5/drR5R+KKP597gYhhZgIszkwfGEx0uxj
	Tps7Rn7b0ar8WBeUG6gSutDD3+TRvD8nvlgF+Z4uMyQSZJxJPiIYk3657x4vx1p0XGvJsARdwjG
	lWrSCJh5r
X-Gm-Gg: AYBFou3nicE9eTBaOVZCH2r3+ehiS53yPLg7FKmphMHAe7gAwOQ0R2oqf5gUXPfF/0Z
	wrzXtkBwp/kaAB/ZRbYqDW5Q8+5uWPpNBxJ6xNgic8jRBHaWq3NTOR4rom0YSV/aTEYnHxeDmD2
	zMAAQraz7CNwpa0Tur5lA3uqow8LAr9zjvcVSjzg796loFwdrbcgJgmg63bNYErdSkx3pbiOilH
	L4pnr/SyCuyJL9IR1+JhO5Waod0tTJrOS9+QmjL/4KFKcpWkFItIhdpJhSfECmIhJuGyTLESUQq
	+MBZEu+QO3KQGkaBWnXF84rYziyNJQskg1PdXfYTRauXlZP1i9PDCHxdZezm0Vv9BR//+RxRmuX
	8mpMQcVp9WMQ+SFwiKuWeC3v7vgNm1lC6pkoSWxxVBD/QKYV5aeqx1P07frnSx5Vsrob81w/X1w
	T/mGkpiMnscVOQx7mMlCTEU3/+AkT5uxX/L5fZExkRMd3xlLugEMQ8lr2gAGF6xNGgTlWBAh1k+
	0qrBliXVx+1vPdrt+5FBWQBgTcmVs//Ul/kDhX6q1DEsa4mYuOatY38WpE3Iz18Ek+XsglU90b4
	0aiLeQWOOfG84pAn9pYxCkv+bmulDngzw5Xj3fydizESBwktoI62KCla9XeHZwUN
X-Received: by 2002:a17:90b:3e81:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3ae8982ab40mr10975139a91.34.1793713634189;
        Tue, 03 Nov 2026 05:47:14 -0800 (PST)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com. [74.125.82.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm4565864a91.4.2026.11.03.05.47.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:47:13 -0800 (PST)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4261170c88.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 05:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByZPpkegIgSt9u443fOXJMKkkM70Z2gwLNlAWSMQdk7/9C8jhbm4mZ/RouDor0fcLPViyVPvubV/3I=@vger.kernel.org
X-Received: by 2002:a05:7022:7f19:b0:1b2:3a68:f18f with SMTP id
 a92af1059eb24-1b23a68f64bmr6139614c88.22.1793713630988; Tue, 03 Nov 2026
 05:47:10 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025143522.327365-1-m@manuel-herrmann.de> <20261025200645.GB1001933@killaraus.ideasonboard.com>
In-Reply-To: <20261025200645.GB1001933@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 3 Nov 2026 14:46:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCt4-Fe0K-Z1fZpSLzP9NgPvPgrFtP8L8AydgM=BQK_WYA@mail.gmail.com>
X-Gm-Features: AclHuK8xPEPmSnJMsCIQnMZV-pQNvjoVqbPFhW04b4cRIhHNAnZsPffF_fOjdMo
Message-ID: <CANiDSCt4-Fe0K-Z1fZpSLzP9NgPvPgrFtP8L8AydgM=BQK_WYA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add support for NV21 pixel format
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Manuel Herrmann <m@manuel-herrmann.de>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel

On Sun, 25 Oct 2026 at 21:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Oct 25, 2026 at 03:35:22PM +0100, Manuel Herrmann wrote:
> > Add support for the NV21 (Y/VU 4:2:0) pixel format to the uvcvideo
> > driver. This format is exposed by the color camera of the Creality Pika
> > 3D scanner (2bc5:0c0b), next to YUYV and MJPEG. Without it, the driver
>
> Could you please provide the USB descriptors for that device
> (`lsusb -v -d 2bc5:0c0b`) ?
>
> > skips the format as unknown.
> >
> > NV21 only differs from NV12 in the order of the chroma samples, so
> > bytesperline is wWidth, as for NV12.
> >
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Manuel Herrmann <m@manuel-herrmann.de>
> > ---
> > Tested on media next (d7e7bca71698) in a QEMU guest with the scanner passed
> > through. Before the patch, the driver logs
> >
> >   uvcvideo 2-1:1.3: Unknown video format 3132564e-0000-0010-8000-00aa00389b71
> >
> > and the color node only offers YUYV and MJPG. With the patch, NV21 is
> > listed, G_FMT reports a bytesperline of 1280 for 1280x960, and v4l2-ctl
> > streams it at 30 fps. A frame captured in the guest has the right
> > colors decoded as NV21, and red and blue swapped decoded as NV12.
> >
> >  drivers/media/common/uvc.c       | 4 ++++
> >  drivers/media/usb/uvc/uvc_v4l2.c | 1 +
> >  include/linux/usb/uvc.h          | 3 +++
> >  3 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > index 0107cedd0..7d918ba0e 100644
> > --- a/drivers/media/common/uvc.c
> > +++ b/drivers/media/common/uvc.c
> > @@ -24,6 +24,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> >               .guid           = UVC_GUID_FORMAT_NV12,
> >               .fcc            = V4L2_PIX_FMT_NV12,
> >       },
> > +     {
> > +             .guid           = UVC_GUID_FORMAT_NV21,
> > +             .fcc            = V4L2_PIX_FMT_NV21,
> > +     },
> >       {
> >               .guid           = UVC_GUID_FORMAT_MJPEG,
> >               .fcc            = V4L2_PIX_FMT_MJPEG,
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 644c2f1cd..60732f5ac 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -232,6 +232,7 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
> >  {
> >       switch (format->fcc) {
> >       case V4L2_PIX_FMT_NV12:
> > +     case V4L2_PIX_FMT_NV21:
> >       case V4L2_PIX_FMT_YVU420:
> >       case V4L2_PIX_FMT_YUV420:
> >       case V4L2_PIX_FMT_M420:
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 99b070ab8..48419a862 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -85,6 +85,9 @@
> >  #define UVC_GUID_FORMAT_NV12 \
> >       { 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > +#define UVC_GUID_FORMAT_NV21 \
> > +     { 'N',  'V',  '2',  '1', 0x00, 0x00, 0x10, 0x00, \
> > +      0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >  #define UVC_GUID_FORMAT_YV12 \
> >       { 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >
> > base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
