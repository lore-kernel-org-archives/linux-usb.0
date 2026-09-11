Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB3E37DEB2
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 05:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103655; cv=pass; b=NruWs+26kVCW6hnAwwLaTvqTybSDQ96Ny7e5q5U40/sbyHJrBWXgzqQN0sYv/IL7x3HtBLnj72gUWVzLLfUvcK9LCWK/udkxYAbjhBgx+033K134jR82c8d80XKMDlw5rf5mt9MmSRxfPyjTxBqoYPotrGAruoUocHCFRHVlAE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103655; c=relaxed/simple;
	bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rv02f2KgfAGAHzupuL7fe/lb2RT4VEf0d3hE5w3MHtDYf/ChPqJPJLU4xkhMbTGsI43pMrd8LdOtBGyMLn3whmfl0ssdGy92AQu8o1Ihk4xWUtY2LDA/1UAuhWuT/zFmBcDYZoxEKDBX2s/sFXtQbFA2ot/Zodi0ndqzLgaQfgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxOPaxXj; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxOPaxXj"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9865so3620735ad.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 22:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789103653; cv=none;
        d=google.com; s=arc-20260327;
        b=YCej2pBPozu7WH3Zdjoa5jEAq+LEZvZ8TpE1f66yxzZjPwv+DGransDn3Fd1n7JNaQ
         kqF83rm44Wu7jnLA3293D8iklv8pooXoK+WAZ29YT7oiAFw0bdMgxnLiEOD5L/g6dPq3
         jLm6SHp3KZch9rg7pceFrj35FwufyIctkblh1nHWx7akKGgDcuNOdxpY0WBU3iRjZo0t
         zPQNdFkG+ZJjiSFqvSJpkcedEPchgmeag2ds7bgnTyuej7XuaTnesf3e8Ub1J50/ZcKt
         O2+34pUcFfYR41AGzr4eTiULFzZM+7SM+6M4kJGrjZHlNAFsiptPaSE3aMVeNCVbH0Jp
         rYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        fh=mh/4V6XiggomJDPwRtINEzn33+ROg3pf8+Im44Zu1SA=;
        b=CvfMmZSI1MinIDJTGIFR/BHRrJDHb0Jg5f/uvQj0QWXJXlO9qyHp29M1lngNyw9msd
         N4JBnI31UMcSNWGUNYnHmc6TiOZVqkFZRN7oeASB4Z11275MAT38wJ7TcUVgzV9nMOXa
         lCQQboulX7TnkTFx/GKDiWxN1rIT24Mgj/H4DW1R1wBDM1n1KV+K2pYosiJdKZgtTlzY
         Hp5YhAz1jFhf9MTBq8T3s2JhmEOsr7oeWBC7VUjZY4iIbBsjaYKNpTlwnhkJEAFFQr2q
         Uh4+dVfmMYRwuEHEsQjdAfobOJCeFu32xPK/lJYdixeTSAAvPrsrMx87GR8Dz4d1MFKF
         1Sxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103653; x=1789708453; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=UxOPaxXjtgJPe1tiqCkPoSj61g8Vl5PYOj1H/lISebiEGxIOeWP1MY21cICuDtHlc0
         gwnWFigFLVTDEZWE1sxRdjmhtYGdtyD+ZD2Clf5gVTuFPJEN67hF/quPK/C1D3O5xakX
         rFhLJ8fxM/RMShX9RZtMLIPYnH/SZDVcykJsRpFp392qc6Qq2qFMThAIr1ljbs2rn4WJ
         5Gky4s7F+Cx94Q2p3kFBlKg2MewW4HHV0FOrMFjhhMAqcha8+AZsWs39KG67XYWmHwES
         O1l6/jFGe3n3MmKd3jV7GZRcM+sn0sKP7wxZV9nGS2mJ2cmQuByZygLlF3BN7V0wZG3W
         NbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103653; x=1789708453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=rNwtE9JtGAlUDPB5hkqrhRMogMemKCZ0bG3MuSX4ZnvrdKYOJKZk2LjRTsNFRdMgz5
         pMJRPp7ngXrwLVwU/myDyi3QMBH/ShJfpjVy/2LPcQd47vgWFFHNs4ivzC8/kXAW067E
         kWmLF5cxO5Nipp0cvxyrCm3IIJ9IUrdhgv4+5TAoMUHbznfOurjFLIi3qm9tzr9ehz4Z
         FRKlHdh4HiPKxdMX8pGFIfmAp60syVkKnf7mYGAmIUv21NYv+eue3cGnMRyXiY1l9eiT
         b2CAHuGnMxGCvNBt2T2c/L5BFCJgEtM9JKtF14Vv6FOSO4xDkQjNRNL6qVjntLcTTr2W
         f4kQ==
X-Forwarded-Encrypted: i=1; AKwUvByW4QkP0BOtKeh1rHgoCk6g5u/2aDg2YAX75hvVMrHbAj0NeNlwC4ORNzEwrVZ9p5fvwrrQ+uZngH8=@vger.kernel.org
X-Gm-Message-State: AFuF++k7tYPHO6zREu+uuenTkWIkaTIg2Sea1OvtJzXFOOMG1n0cznD6
	gcdNWd9yl7rW8gFlZkK35DYSwP5BugJpRKUczZQ3sg/5ptfNsQIWGH/Nddf64A2Fd3HdInpZpLY
	eoTfMnqKc1ASJ8Nv4pnRIYw5Q29S8GJg=
X-Gm-Gg: AYBFou0lIGWA/mFNKG706PTomTsUbQF+oDe/UfpODT72SMHHL59Xrc1dmJUOXb/ZL7L
	4rCgSjUorNoObuyBdgqC63kLFHWwo8vjGPEUB9BLyRPaSLCcjH8Q0L8/QjmCcci0iEJmz1KTw3L
	CY8vDGDSCC6FakCYdV74xy6xMFo5GGVKAr7unf4Y0TWrMDFPx0pdXCxMl/Q4o8HdS8t0RucaPIS
	N7RpYblNZTJ4waz2lR1JmNY6OoWeuhnbcC6dIJ+xLtQbOy85PfqC3PNXLlWU2QCdEhdKjm6ElJF
	3onUC0yri8Fro0WQpaNi9ShpBiNKbkJcRhWKa/7fSoZ7bxisTZ67gHpgmaLcoGtrGfIRHzxAWh7
	YkSUBpYghWgA5+kd3fsU+mHsp6KeA8U1nOlf+ykPjzNmTpTdcSXXqQNC7e7nlxBJTiUM=
X-Received: by 2002:a17:903:2451:b0:2db:7269:38ef with SMTP id
 d9443c01a7336-2dd2a3362camr50043605ad.14.1789103652898; Thu, 10 Sep 2026
 22:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810093112.47807-1-phucduc.bui@gmail.com> <20260810093112.47807-2-phucduc.bui@gmail.com>
 <2026091054-preflight-capacity-e7e2@gregkh>
In-Reply-To: <2026091054-preflight-capacity-e7e2@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 12:14:01 +0700
X-Gm-Features: AcwNN1U4E0obWJZ95GdL5H5vM5ixf2nzVS2DjnR9WxfFgAkwdtRnN-OtjhWnZCA
Message-ID: <CAABR9nGc+ERL_AenTWzHZwxUeRB4KqyvMB5REOgGzko7X-+p8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for letting me know.

>
> This patch did not apply, please rebase and resend.
>

I have rebased the patch and resent it here:

https://lore.kernel.org/all/20260911051043.15962-1-phucduc.bui@gmail.com/

Best regards,
Phuc
