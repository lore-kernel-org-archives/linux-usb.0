Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF59C4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 08:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEB512186A
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 08:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ErHWBBP6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfDEI4i (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 04:56:38 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:45776 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfDEI4h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 04:56:37 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 25A4224E2DF4;
        Fri,  5 Apr 2019 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1554454597; bh=1Co0bRmBfDowjWnvDplid8Vwcf9IIs7PxvNiV/uDf0U=;
        h=From:To:Subject:Date:References:From;
        b=ErHWBBP62xxH9qjHsumIJkaswfZA1dES2jYivXx9gkaPTkFAbVuAfCP9oyW3eBT6b
         52FwE08VP0eVrAPk+PBv1DfOa/nSxPZAwfyKOJhxYvA3+j09v7FS316TGcrvkzQ6Fu
         azeb6wdP45ywnClqHlotQ+p73J24TwPfEflMEN0vOSLZiY3CNnCjwYbrgpsXPd7BqJ
         ya8r8hfvJEZlKO+B5Aa+mNOGu3F7T+j6dtpNTIND6rvDVUfMMMCEV53Sh3pTGkYr7Z
         4vdEfUNCmLXG4LztISoGVY9nEO1+YOq4hzGCblqtCom9STH+Flj4QuW3JJ0neAM/gy
         Cp4Oy+DxO33/Q==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C83E1A009B;
        Fri,  5 Apr 2019 08:56:36 +0000 (UTC)
Received: from AM04WEHTCA.internal.synopsys.com (10.116.16.190) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 5 Apr 2019 01:56:36 -0700
Received: from AM04WEMBXB.internal.synopsys.com ([fe80::1006:bcdd:1b7:579b])
 by am04wehtca.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000; Fri,
 5 Apr 2019 12:56:33 +0400
From:   Minas Harutyunyan <minas.harutyunyan@synopsys.com>
To:     Wayne Piekarski <wayne@tinmith.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Kernel oops when using multiple V4L cameras on ODroid-C2 meson:
 9600004f in dwc2_unmap_urb_for_dma+0x1c/0x28
Thread-Topic: Kernel oops when using multiple V4L cameras on ODroid-C2
 meson: 9600004f in dwc2_unmap_urb_for_dma+0x1c/0x28
Thread-Index: AQHU6xQOzq2sOr3ODEq08sKuM3ZjFg==
Date:   Fri, 5 Apr 2019 08:56:32 +0000
Message-ID: <410670D7E743164D87FA6160E7907A56013A80FA9E@am04wembxb.internal.synopsys.com>
References: <c5ee9550-29c6-580b-ba6f-b06c11940119@tinmith.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.116.70.132]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Wayne,=0A=
=0A=
On 4/4/2019 10:27 PM, Wayne Piekarski wrote:=0A=
> Hi everyone,=0A=
> =0A=
> I have three USB H.264 cameras connected to an ODroid-C2 running a=0A=
> latest Armbian nightly build, with what appears to be kernel 5.0.5.=0A=
> =0A=
> When trying to access these cameras via V4L, I immediately get a kernel=
=0A=
> oops and the device reboots.=0A=
> =0A=
> It appears as though the problem occurs in=0A=
> dwc2_unmap_urb_for_dma+0x1c/0x28 which is in drivers/usb/dwc2.=0A=
> =0A=
> I'm not a kernel developer so not sure what other information I can=0A=
> provide apart from the oops dump. I can provide other information if need=
ed.=0A=
> =0A=
Could you please provide register dump (debugfs: regdump) before start =0A=
playing and provide verbose debug log after start playing till oops.=0A=
Which is speed of your camera? Did you connected directly to root hub?=0A=
=0A=
Thanks,=0A=
Minas=0A=
=0A=
> thanks!=0A=
> =0A=
> [=A0 204.624452] Internal error: Oops: 9600004f [#1] PREEMPT SMP=0A=
> [=A0 204.635515] Modules linked in: snd_soc_hdmi_codec dw_hdmi_i2s_audio=
=0A=
> dw_hdmi_cec meson_vdec uvcvideo videobuf2_dma_contig videobuf2_vmalloc=0A=
> v4l2_mem2mem videobuf2_memops lz4hc videobuf2_v4l2 lz4hc_compress ao_cec=
=0A=
> videobuf2_common meson_dw_hdmi meson_rng meson_ir dw_hdmi meson_drm=0A=
> rng_core rc_core videodev drm_kms_helper cec snd_soc_meson_aiu_spdif=0A=
> snd_soc_meson_aiu_i2s drm media meson_canvas snd_soc_meson_audio_core=0A=
> meson_gxbb_wdt drm_panel_orientation_quirks zram snd_usb_audio=0A=
> snd_soc_simple_card snd_hwdep snd_usbmidi_lib snd_soc_simple_card_utils=
=0A=
> snd_soc_core snd_rawmidi snd_seq_device snd_pcm_dmaengine snd_pcm=0A=
> snd_timer snd scpi_hwmon soundcore ip_tables x_tables realtek=0A=
> [=A0 204.728202] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G W=0A=
> 5.0.5-meson64 #5.77.190401=0A=
> [=A0 204.745037] Hardware name: Hardkernel ODROID-C2 (DT)=0A=
> [=A0 204.758748] pstate: 80000005 (Nzcv daif -PAN -UAO)=0A=
> [=A0 204.772475] pc : __memcpy+0xa0/0x180=0A=
> [=A0 204.786168] lr : dwc2_free_dma_aligned_buffer+0x78/0x80=0A=
> [=A0 204.799988] sp : ffff000010013da0=0A=
> [=A0 204.813726] x29: ffff000010013da0 x28: 0000000000000000=0A=
> [=A0 204.827504] x27: 0000000000000038 x26: ffff000010e960c0=0A=
> [=A0 204.841198] x25: 0000000000000101 x24: 0000000000000020=0A=
> [=A0 204.854820] x23: ffff000010e9d000 x22: ffff80006b378594=0A=
> [=A0 204.868394] x21: 0000000000000000 x20: ffff80006a124f79=0A=
> [=A0 204.881902] x19: ffff80007e6f1800 x18: 000000000098090c=0A=
> [=A0 204.895494] x17: 0000000000000000 x16: 0000000000000000=0A=
> [=A0 204.909050] x15: 000000000000014d x14: 0000000000000400=0A=
> [=A0 204.922531] x13: 0000000000000000 x12: 0000000000000001=0A=
> [=A0 204.935862] x11: 000000000047f7f9 x10: 0000000000000040=0A=
> [=A0 204.948999] x9 : 0000000000000002 x8 : ffff000010eb82a0=0A=
> [=A0 204.962085] x7 : 0000000000000002 x6 : ffff80006a124f79=0A=
> [=A0 204.975122] x5 : 0000000000000000 x4 : 0000000000800200=0A=
> [=A0 204.988041] x3 : 00000000000001f4 x2 : 0000000000000002=0A=
> [=A0 205.000822] x1 : ffff80007edbf202 x0 : ffff80006a124f79=0A=
> [=A0 205.013627] Process swapper/2 (pid: 0, stack limit =3D 0x0000000035e=
14788)=0A=
> [=A0 205.027581] Call trace:=0A=
> [=A0 205.040442]=A0 __memcpy+0xa0/0x180=0A=
> [=A0 205.053332]=A0 dwc2_unmap_urb_for_dma+0x1c/0x28=0A=
> [=A0 205.066319]=A0 unmap_urb_for_dma+0x18/0x28=0A=
> [=A0 205.079213]=A0 __usb_hcd_giveback_urb+0x38/0xe0=0A=
> [=A0 205.092009]=A0 usb_giveback_urb_bh+0xac/0x108=0A=
> [=A0 205.104753]=A0 tasklet_action_common.isra.2+0x7c/0x168=0A=
> [=A0 205.117479]=A0 tasklet_action+0x24/0x30=0A=
> [=A0 205.130030]=A0 __do_softirq+0x10c/0x220=0A=
> [=A0 205.142521]=A0 irq_exit+0xac/0xc0=0A=
> [=A0 205.154950]=A0 __handle_domain_irq+0x60/0xb0=0A=
> [=A0 205.167376]=A0 gic_handle_irq+0x58/0xa8=0A=
> [=A0 205.179784]=A0 el1_irq+0xb0/0x128=0A=
> [=A0 205.192121]=A0 arch_cpu_idle+0x10/0x18=0A=
> [=A0 205.204478]=A0 do_idle+0x1dc/0x2a0=0A=
> [=A0 205.216787]=A0 cpu_startup_entry+0x24/0x28=0A=
> [=A0 205.229051]=A0 secondary_start_kernel+0x19c/0x1d8=0A=
> [=A0 205.241263] Code: b8404423 b80044c3 36080062 78402423 (780024c3)=0A=
> [=A0 205.253985] ---[ end trace 156b59abcb22f143 ]---=0A=
> [=A0 205.266298] Kernel panic - not syncing: Fatal exception in interrupt=
=0A=
> [=A0 205.279479] SMP: stopping secondary CPUs=0A=
> [=A0 205.291947] Kernel Offset: disabled=0A=
> [=A0 205.304384] CPU features: 0x002,24002004=0A=
> [=A0 205.316867] Memory Limit: none=0A=
> [=A0 205.329314] Rebooting in 10 seconds..=0A=
> =0A=
> =0A=
=0A=
