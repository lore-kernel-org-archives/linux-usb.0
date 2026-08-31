Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1612EBB8D
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178949; cv=pass; b=ONr3Y+ghsM6zwCOMvuXr6usKe0nb4HF2VipiPOlR482tt1Mj2yBDNcMKHkvvGaZby6ny2R9Kf7bjLjn5a4llYN+U6odG+cTRz3ARxEx4R8sJVzWxcY1HUq+dbkIy1aj9yG58T9PKOczP7BJa28I919f6sjV0Kh2EfJCh2DvIUHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178949; c=relaxed/simple;
	bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=af9irzudO8O6A0jnDWB4dntCczcfbSTGdKNxpxzHxv0u/UWcBF+M3VZ4ss/H+aYdvyunOw9QmdpixTA9rLUNtdb91qBilH6NBx8JX9B9LMpc8aVCoAV4UdVxqtQN1+R+OYIyM9Lx0CbfbrtExmH0YJnNWxoRiYN2Ehamc3LucVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaW5dcOv; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaW5dcOv"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66dee7a0c09so2297339d50.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 05:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788178947; cv=none;
        d=google.com; s=arc-20260327;
        b=XIrkjeQgEdx5SEHGNOJgVKEFMz7AqP11gzv+4lOE3Y2FIgmm0LZ8ptgX9iMI0zAOyL
         vmPa3TGV7K6Uz4jEd4G9KisUTVEiEbrLqIQnjzWcp+7o0iUrnCCjdjxXpmxIgQSCvGlx
         43XTHGCIPaLQukOIYxzgiSrwpyV2GXT0wQz2qdeP9ZtYeLrOqsZydoodcmVTbcQA6TcD
         1DZ3uw4OcMtgf3QHJylkxt1p+qK7vhjB7v3w4LVjg1YtADMttXFjKXtuXAoodpx9si5V
         JZW4sQJKUcSkMu5ik5FAKA2zqoC9sRfUrWBr+Ce21oaFUeap6MpEGTbmzg3+JInkLset
         arqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
        fh=3SmnNtosiTWFe1DxlxaTcNVNqowhIkeI96SWYwZr7LM=;
        b=mt5+mm3H07vpqv1aI1CdJQwKhTi0NZWW2jZ+mE83XF4K6q1+cgPpVo8cifN/potbCp
         WmalyO94lp4R7Bpa4lwb6YuxJh4TjQ4vjS2I2Mn3NdHxuV1l6oog4ZgLvNocOAWMrhO/
         86AjiERRY08diClf2LV9kKZ5IBMBalEMY4g82xpphr4EsSX6mtfuzigH4zilspseWobp
         toqFdh8nJK0JZSbjgFSjJDDIMS/0EwQK+akZBm3v7n4X6la6ME11rkDeXM7lXf0fmbyM
         c+6g55yItU6YED/O9LvJX7LUPonPDPZN5q02gAJDiWX0kTeR1r06WiAwcb7YHiqodJlF
         s25Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788178947; x=1788783747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
        b=EaW5dcOvEFk/KTJeuvzfX8H88VWNyq6B0gF26rZ7bjseZnZ2U69B644WNUzEmhoUeg
         R6T5jzRTwK2waZm9Ak/IEugDkNu0mu0LBLMCKgRYyd9TTeOqnArM/jPCIhtHErj85m9v
         qaG3XvN2sfqo3PnML1blyjX0QUmsJGUIM2KqHzFs2eoQMOj9oQWSyeCJxs5uAQtypsGx
         MBkiWNpVx6DnPvBrblo7FPYcy36ibLDpLBdT8DTEyQO3xqpEn1r+WgBi9MFCH01urm/m
         y7QkpRQjy+OTUS8+74zoxRN7NE/fesE9De9GrGDp2d71u0ojOtNRfiq8oMKo59rvwSQh
         qhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178947; x=1788783747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
        b=hjzme9NxGtGxk1uSOMlE8nqwG0B/hIz1TruNKtaIz1nVMTy4GuQDo/Ng9syQUMmVM8
         AeniP2XxvjiUCVZ8YrxWsYXh9LTWWnThM+tCUT/kaTxfu8eetxekJVT/LWNYSfJAhCr8
         DnylTMvFoFuQ4hFL5w/soIW8D89yjuy4WqbsLq7ZC1mA8nOqKFHyJbaMQS60O+jkIgZm
         bFTaU2O6281Xw+FTwYBQOChnMm1GrJzH1FBQLL8rsXycHGQnV7nuMta1+f+oW5seuyf/
         wq+AunTKd5/02fEBYH56oyu/4VO5e8wohhh7Xlf970a9bFtncQCS34x6scqYwGosqj5m
         uS9w==
X-Forwarded-Encrypted: i=1; AKwUvByT1gTA0+MNcJpHggdCK2IqkanTgvsQsHKXe9/RqbJ8U+5RsIeJyBCW296ggrbWJMRUDMedTsUXp9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l1h6AS2X5SmaBc+3zza0Y7r5TxWVoybFxsliS/pYKqRtRNQjPa
	GiJvSrE3saUlLpfrDDevLpYiFExMK2qXJBz87rxSQ4eH9hanv4FtxkJUxPuhkatx8MakERCpXvI
	U6SASU06uwxHYE6DFzjH8kB84BDMxx8Y=
X-Gm-Gg: AYBFou1d423vLyZlXYMa70mQAvl98EAqr/6bu6HoukIfdXm+ksbnxmyxhEVCrxRxHUP
	zFq+s7romh7BsFVSrtLv0ipefdsjqmYG151vdZd4AEmbD/3rp96tFwnQySLjbikdgaorIX/0EuB
	iFoRGAtE06jVoGNCN/cdPBYM1y1HChxq9pA5noYwtzx4axaKEuONOmnlqlmmtZkd39nvFEbnN4P
	mKlpjGDS4Q7WU/7TKNS05iez7L9TUyDGc8aDM7uLGI8ECXGOfRTzu0hTsCJ8YqL38X8rXYs6cGH
	hL4UX5/1ZzjeuR+5ohnEN39D2pG4RuBmbRPBFp3ntr0C+EQgwdOXMWPd7/fhKUJ0wzLSFD8Tslv
	dPITQDV+b8f3+rpO00sL8qUF5GoRODKG/8Q==
X-Received: by 2002:a05:690e:1248:b0:66b:1421:45a with SMTP id
 956f58d0204a3-66e4c65bf8amr7596387d50.7.1788178947190; Mon, 31 Aug 2026
 05:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816061034.17769-1-kartikey406@gmail.com> <2026083154-choice-platform-51c9@gregkh>
In-Reply-To: <2026083154-choice-platform-51c9@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 31 Aug 2026 17:52:15 +0530
X-Gm-Features: AcwNN1XTBkudp1aNX14_rGhl3HkgH0yayASMF94zLItoEAu-SwNFkmZ_PazQ9b8
Message-ID: <CADhLXY6MN1E2xfnhodGg7SH4DnjF8uYVBDtJfqGXTXNeKdgxDw@mail.gmail.com>
Subject: Re: [PATCH v3] usbip: vhci_hcd: let the driver core manage the sysfs attributes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	yuyang.du@intel.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:36=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Aug 16, 2026 at 11:40:34AM +0530, Deepanshu Kartikey wrote:
> > The vhci attribute group is created in vhci_start() and removed in
> > vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
> > usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
> > attach attribute is live while only one of the two hcds exists: it is
> > created during the first usb_add_hcd() before vhci_hcd_ss is set, and i=
t
> > survives the first usb_put_hcd() on removal. A concurrent write to atta=
ch
> > can therefore reach a NULL or freed vhci_hcd_ss.
> >
> > Register the group as dev_groups on the platform driver instead, so the
> > driver core creates the files before probe and removes them after remov=
e
> > returns, and drop the sysfs_create_group()/sysfs_remove_group() calls f=
rom
> > the driver. The attributes have always been created only on vhci_hcd.0;
> > an is_visible() callback keeps them there.
> >
> > vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
> > platform_driver_register() so the group is populated before the core
> > reads it. The attribute array is still built at runtime because the
> > number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
> > preprocessor cannot emit a variable number of __ATTR() declarations.
> >
> > Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
> > Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D8753715f05759f1a10de
> > Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> > Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gm=
ail.com/T/ [v1]
> > Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gm=
ail.com/T/ [v2]
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
>
> Did you forget an Assisted-by: tag?
>

Thanks for reminding me. I will add it and send patch v4.

Deepanshu
