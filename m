Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E9440DB49
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925469; cv=pass; b=KM+kmIK+6olRF6PxT8kPPQwsE0XpLf9xR0M6AX1QG0xStmmf9FjyfmYE2HMy26HDP2i5CbXrIPRpadjFECQ1rs9qhFTFO3uMhnNZkPz8nePLVrfd2Y78GeCIx0vZMmIQx4dLwoN9MOFmhYgkOaZtjMFxcfZpDarRSIn1+EOo1Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925469; c=relaxed/simple;
	bh=2ci/OJPfXjP6+5pMYAf2u5luU4wTHEaw6qnao/bTC/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqtnQvQYw7yBNSBgauV6BST/CVcwsWQN3JLJaEXu/ZzSU+7eRnUETpVp5hAr71QwLx41S6+eFIxTOGxHvruSrakGc3vRB4sL1meILaLXpsSQbVjjsZDpfs+Rvx0NqvJIdAgEL7DtGTmFXaS63JiwD0HMUNj5h1m1X8+nIFZQ7LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rv6R8i2Z; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rv6R8i2Z"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeba09900bso618219e87.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 03:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785925465; cv=none;
        d=google.com; s=arc-20260327;
        b=fby/m1vpxaetYoIZRCYyf/K9ikv5oOq5jOmfSmcb8WTJjF8DIR10O93/xJMMEVY5z5
         ac7dtqtxZlnyYnCufv8e8KjFb2imJYZv4WtpTXvZmwTCUoLohIilIy98Ik1JWmf2BrZj
         FzQaA5fd4TJ+Yz6c9l+FqfoyVlZ3ULDUJW8KIPFDHAsB6jtciEw8wJyn4GAIMVcbw2+s
         97nF8GWMkg23OrLousjfUKNchonmmc1JSSkQXmYRwZXolKcP+TcFC6EkXblTqbE8jT2S
         FUGJumTkWGFP+L1KCjJDHUNxvNeF2GCZdN2SPDBwihA5LiiDhHTs0R4N5h7obmyoNFXH
         XsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6pjX/OGQoDuFoc2/YJ+2dY5TuMK64B4u+8Du0asegxc=;
        fh=or8zft3HVkId96suwuQXB6/lbiwn/U+l4ssnIEvSP/c=;
        b=Wq6LQfIEh6t0oW9uDGuWhASrqHiAFRvKu4UEYQJG91KIA4/ZjkbKdGMggALhNXGPDq
         m41KsX/kzSf7NHqaFBM/vJ6reAyChvOEOnON601xtd2CsNatAr4DrmEbPwzBtI1aTyr8
         l1B/o0L5ycfOsFheEuKtBpGCBVhzTaNSqRzdUuRpcc74RgyOL/ekKU7Rp+ZbPXwYH60i
         GSFZnTKNw5RHpkZO/JPa6VdfhMhAb4Wnh0JXlhm1cJzVbNexOgfDBnWQ87aY/qzZ+AlI
         Ew7EP8ALGUlc5dGortF4lmcIHAOqbTSqbrX27p5YfcttILJID3639Qngd9OewpMeRGc9
         jkXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785925465; x=1786530265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pjX/OGQoDuFoc2/YJ+2dY5TuMK64B4u+8Du0asegxc=;
        b=Rv6R8i2Z0/kFypO+swm/S/i6761iQrZEL/UZTy8re17eG3idDbrIXb0RNW8XLmgzwI
         JsIOcvvY6vaTr0x7Q3DGqGG3PCqq7K1HSGZvQXa27klM+wX4TnVbQgzrZoPdosJKdpfw
         IpTwtnGOGc3427oEsYvjWbgG0ul1gsRznb8HJozCu8Jl7jCg1TBsnr2uw4yLrkvJLnne
         8RFiunJ8NAj2abFe3u+z7bPMRF09EPUNqa7doMpFFOlI6fmgKVSBf9+zzDOfJnxZyJ5v
         NlM9YD9OWHcrsEluUUT43ODMyrIbIBPzQFCrB8Gu9yyon/y4WqgaU1yB5z8x0M/FZgLe
         nSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925465; x=1786530265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pjX/OGQoDuFoc2/YJ+2dY5TuMK64B4u+8Du0asegxc=;
        b=J5jGiyVdAb77bH5dHJREruI8MI59q21I4shP55fCtZksvyfjcAYV1D8xG4MSnuOKEu
         LhrhvDkRcUHDJvoy24ZFTvddUAnXFFcIWj3Nms70n5NJ04EZGeOTrD/hgrA2AGjai7Dj
         PH0LCD1lKzIxIQ+2UvpESuK0iEb9SQ2kp8k/0/6cAVx/qk+fiFSguc4lzDHC8FMmK22K
         TmYAD3pTWWPz5bHoAcxLJTkGsdHMBVW31OQQjmv9Wp3qCW1hBK2o2lnCu+eoMCjz9ZKj
         nejcSaUuMPKAC+8Gqs97Lygp9jTo2lbaZFs51dcfTFOIAxHNdXFy1HU/p/CoJ37G6jB3
         7WnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlyUNUkA6mp9u0JYisuuREWENOfkM47vT+PzOUO0zjusU0h9wpqHMVXTFOkKI/foso1AJ5Y2A/PGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDTjRqe+T00UOPqNSdVPCCiSXvvvfBn6O08nO0PKvARFyjtaz
	NkQ/vVOns28FHf/YS6XGt00tjoXMkFhalLeAIje46NuoHNMWnqKg20Xqd2vNgW4hL/vdP3cK/ZT
	W50a+6NdcuZ3wa8BGMqHh/92ct3Cih56zqAts6HllIg==
X-Gm-Gg: AR+sD12iIr2C+9woNyHrCvnup5w51j6WcLIF5DkVCzYVPller0vh6uQjg4Bj72oLreZ
	TlNCeiqyPIAollWU5gN8DjkAoRAOwxsxsXIxz04DNgeXRmDDxqh/eBFNs0zFejazVcPepRF+I54
	u8RAGZjwiPofcvG6eDUChsRRMpudjOekuwZdBsGmq9Rrt9nvzNmKDFi374PAA+d0VwSwbo0vuXH
	wYrADDm3LIPEUEM6Ii8XUGGhlIx6pFZxXmf+/UbmvWIDRfPhPqUHkSFjO+rgDRnFoEfdcMfS6Mi
	e5s+p24l7d/swsAYhxnz8+Tj8vDDxBuQrfqgkvLtQvHwm54MWaztBwmgLYq0iGYlmiHBTxy+V2j
	aIA==
X-Received: by 2002:ac2:4c4a:0:b0:5b0:113d:8ac8 with SMTP id
 2adb3069b0e04-5b2f4cadc4dmr811514e87.23.1785925464833; Wed, 05 Aug 2026
 03:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>
In-Reply-To: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 5 Aug 2026 12:24:11 +0200
X-Gm-Features: AUfX_myZAUeDwCizMHjR8fzyc6c97luL7q3PuJE9UT2Eo79VbcyRRnbMoJSyShc
Message-ID: <CAAofZF6gAzJUKG7M2s+rJn4X5rQp-mKsftkhh=uvVnnY_498AA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: core: defer leaf-device resume off the S3
 critical path
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: gregkh@linuxfoundation.org, guanyulin@google.com, 
	rafael.j.wysocki@intel.com, sakari.ailus@linux.intel.com, 
	mathias.nyman@linux.intel.com, eadavis@qq.com, kees@kernel.org, 
	dominique.martinet@atmark-techno.com, khtsai@google.com, 
	stern@rowland.harvard.edu, oneukum@suse.com, thorsten.blum@linux.dev, 
	amardeep.rai@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Aug 5, 2026 at 11:37=E2=80=AFAM Hongyu Xie <xiehongyu1@kylinos.cn> =
wrote:
> [...]
> @@ -1643,11 +1754,22 @@ int usb_resume_complete(struct device *dev)
>  {
>         struct usb_device *udev =3D to_usb_device(dev);
>
> +       if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> +               return 0;
> +
> +       /* Queue the real port reset after dpm_complete, once every hub i=
n
> +        * the tree has finished resume and downstream ports are settled.
> +        */
> +       if (udev->defer_resume_pending) {
> +               udev->defer_resume_pending =3D 0;
> +               queue_work(system_unbound_wq, &udev->defer_resume_work);
> +               return 0;
> +       }
> +

Please note that `system_unbound_wq` is the old unbound Workqueue. You
should use the newer, `system_dfl_wq`.

Thanks!

--=20

Marco Crivellari

SUSE Labs
