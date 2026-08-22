Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9292C134CCF
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 04:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787371340; cv=pass; b=b1+VWoE0SfbTzL1zrdMdi++4TSMCKBuqr792h1NYOZ2OzT+P1v9uI8ZTYvLZFUx3KdW+3AFvK2S1dmzS8ZU7sSV1Su8HdD9JR3MxThmGgo5hzDlcg+zw9joI9qIkIuU1OMjVTeACzbz1u6mf7UmZ64WcPq2hjGvXZr/jDhIV5XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787371340; c=relaxed/simple;
	bh=lphsgurMoUNp36e9TCAZFUESAq45fSebV9rJvg+RlCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMHPsPQ0t8Z6ElMIx6agJHAfprwq0mVKZRNgQHW9lva2gxSkJcEfO6nLNa8IVF56SWifPYpoZpdnQH+t06HpY8cUjvGPx6SJlOfpIttiGwDgKZXXPHbFHPJ4aUFersgb5cdsXpeqh0bNbI460lvGDiyfqKNiXhw/iO79seCKxD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A593cddK; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A593cddK"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7ff05e5d009so24934867b3.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 21:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787371338; cv=none;
        d=google.com; s=arc-20260327;
        b=Rx3MtijoU3CElhTpCktxR/TExtZtsik97Yxj+aqqKLGSFGk3ZfOZrZ6AlQNytJAc59
         7Um/0jX2cMVWCYu1Yen3uNNeCWk0j0nnkTLvvi2dOo1rzOPXbv/sq5KXT2Khwmr3BG3r
         O1BqM7nv8yQuDwNC/V4iiYUwgS5VVZOuQV+kOG1Ci34O1TZncwkas9mhzNkOG4WIKxVH
         0+b5ZbqJFd0VnH5ey8bMF4g0FyDMIz3QX6Gr0r6Z29i2EaDvKJNqsYkoU7Dh62HlOO7y
         MDl4glIXdxeHH+v6bDLPiqGRpAauhyvFb8y+xd4SMPUv56kYPdrFrZ1R1o+HK7Jcpgl7
         D0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qZ3T3hVT0Mc2DJVxKI1bnzc178leXaMFpu1fcBI9PR4=;
        fh=NcA4jAaYQ2EPSbcHcOGiqkL9djuGPdGpGGVnI5eRYnI=;
        b=HVZmqEvK6PxI66sJ+k9bU7lZqYV67fNw5p+fBfKcQazQkIVSK/Rjp/EbXk6989GOvk
         5W2QCjoXVhYShETUTmmRueWptJJvGujlR2PordtXRLvg9fqrbQaEO5CoG72I5oKv9qxD
         gIu3BrLLMjG/R0y/MBn4/TLjbzL6id++kwXpZRijHlly8eT7AddnIEWkYdIzWx2TGVNv
         rLSKI/rA8QZy0VVAE4BFSG/EORZ8TDk1/ngi8fUd6mTQ2YKMEoTTeZabUB41MsJ/4FKo
         dx6TbDcNGzDY16WZICEr/AQtXJKBIWMCBDSPECV/5zqD/KYlosj/gCpHyBiUUj+yugJS
         H4oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787371338; x=1787976138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZ3T3hVT0Mc2DJVxKI1bnzc178leXaMFpu1fcBI9PR4=;
        b=A593cddKfcuTQdxkCO8b4EgQCqN+kBb0r4qhJqQZlcg372JTyFAmwBgOWd2B7OmGlO
         GNCQujix1pghJO0fXnytOcB9tdeAdb7v74u1iwXiNTONHDBaaZBmqMSONO7mg4u5oFHL
         SU+VkR9YoriD+/iRrDW52w5plHmms73IFVDLDpaIx+eC+pKrG/b2Dmu0l8vOQtOYQTNH
         PzZusRG0sxAVatmu+m8gl4j7BkeweaLWdd4Cfoam7LQQlWPIczqjlzdlzO0sd/QyKUnr
         VO5jx+Gr2TFEiyb9g+oFvAjhvSSN7fQVTBay8X4S7KtclVh1rUM6PEb1IK6gWy60Ot8G
         rxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787371338; x=1787976138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZ3T3hVT0Mc2DJVxKI1bnzc178leXaMFpu1fcBI9PR4=;
        b=H/jG3WO2nl3Qk7ZSFTIhd8WncID7/4cuh9J7gjNRo7hvDbTXrBU7uk3givH5hhYwsY
         MGrxCkmTimH71QHa857CkhVKbvrh4Gbj/llJ/WPF+4pv5dcp4I3r1z03hc/5oAqm+3tK
         KYE7vBbvhBL5cx258fFgbHVSNVaO7+DilgjOECfEsB7aa7R/XV2NWA9CI+xovTpUFVDv
         i/QrUQllaRsAKd8ed6mQqgj1p3Fl0G8EV86Oe49dut5OCTnqA6F1SSpXIHE+Ao2gtm6z
         QJTEZmXj02E8nghoAds/Zqpks8Q8J6WZhy644xHMI/qBkQVREKOu/mG6+VY+Fb5ic2Co
         kcxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiXayPHi8ptpGUzDWRjq+z8Yz+VduXrR+Knr3OZ0y7vcqL2uiaGTjL9XtW6M9IfYZe/YZBNZ58o+g=@vger.kernel.org
X-Gm-Message-State: AFuF++nqxX9cxaKJVMedYLwV6qYMqUvqIwdxzIVo221rMPv4NhFV56XA
	sgAbFBupwYQYzUHWG/x8nBkydKfpPQUH7Ahf2TNHwsW0Dbl45ZIDjbHBeLGHVj9yTFcc/IVgpqc
	JwgZL7vm9EH2jA59RqxtcRTO3pHP++mc=
X-Gm-Gg: AR+sD11K765v0Del5h1dScbcRH7BBy2G7wqYGg1PISs4yqkLw/fvYkmNhkQEE03TM0Q
	i04PsFkmzpwemF+BfLIEdb6uPB78qcb1pGzqlioC7ggVpGIM4PRgrwpfiuGHJA0S7/tDmBXAQqS
	U0S1DRx4gr6bfVu2n5eA/XB7zEObuz+rPf2tmCbPxeWc2SGqGduAk50bs6AFcbgo6EcVbS2Wkky
	k7uvadDeeTzazTpPQOIRv8Xn4xflkowZacDuB0HZ3YeqlmrGMlI33A/0wS1aqL2izltoykVQFRy
	mk/u3oHoVIiRc8K0lofHHlW6ZVOdVOeNpAbtI9OFxBGadEsH5oAousvxcl53RCQokKVD184Lq46
	fNrU+hknRkbz52+mvgrdDMRIB6JlOeh9ddQ==
X-Received: by 2002:a05:690e:d89:b0:668:110f:8c07 with SMTP id
 956f58d0204a3-66ce4af1ecamr4458075d50.42.1787371338527; Fri, 21 Aug 2026
 21:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821121220.13006-1-kartikey406@gmail.com> <2026082117-audience-earplugs-ded0@gregkh>
In-Reply-To: <2026082117-audience-earplugs-ded0@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 22 Aug 2026 09:32:07 +0530
X-Gm-Features: AcwNN1Ui-nTS8btlQf-n1foxEBBsucrZ4pUe8e04-IxYTPhj-N0PPhN_1KKnipQ
Message-ID: <CADhLXY6P1p=ggo064P3Oxh7kCYevAYnuwW9vE01rB4qqHpRjOQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: net2280: fix NULL pointer deref in usb_reinit_338x()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, stern@rowland.harvard.edu, lgs201920130244@gmail.com, 
	balbi@ti.com, ribalda@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 8:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> What is it with the forced bind patches coming out of the woodwork?  Did
> syzbot just decide to go crazy here?
>
> Again, no, this isn't a real issue.  If you try to do a bind to a random
> driver, you will get random results, including crashes.  This is a
> debugging-only feature for people who want to break their kernels :)
>
> thanks,
>
> greg k-h

Understood, thanks for the context - I hadn't realized forced bind via
sysfs was considered out of scope for these kinds of fixes.

Alan also left some style feedback on the patch (trim the comment,
drop the # modifier in the log message) independent of whether the
patch itself is wanted. Before I send a v2 with those changes: do you
want this patch at all, given it's only reachable through the
debug-only forced-bind path? Happy to drop it entirely if not, or
send v2 with Alan's suggestions if it's still worth taking as a
defensive cleanup.

Thanks,
Deepanshu
