Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BEA3EFFB3
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471317; cv=none; b=A53e0WWl+IwxlHFNHhC24tXavvkWwgSBfSgNez2KrrT75b2by1HR/91xLPt+N8WAquHnMkaxQLie1S99X71HbIROA2FDHuTsmrv4VjbgJ1blhCD7CgKSHkW6O2ouZ8OGXD5ThsZSQsZWTHGVCHhMFK2GoFnfsxwxDHFRqW4pODM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471317; c=relaxed/simple;
	bh=gTNOeEWct8DPyTxSn0F7yOuuVimMJBrEJH4gZOejtGE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u7X7AfvWWE+ygg+Z55YBRTfUYi0/yiYMJ41o3Yv+Qr17tokJghzehEB/rae3uFcjCwdhnrfo21GAT72twCM/wSYbBPHC6ItcIFV2v4m0knWwVjH6mBigPvurqWjMgItg0vWdyfM+5ee2g4XP/Pq9PpzxpWU1dsue8XfhrxDMfs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9T2EJBu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9T2EJBu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso6199375e9.2
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782471315; x=1783076115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zI4flamkvgrGWeOOrCKfSeqMG8hCDTFrwXFlOJzIeA=;
        b=V9T2EJBudMJ+UMn/rfqlIoFADtea8CpVs945eoPNlWb3IB07aOvD+0mRxWXyn3yfNB
         NlsVtEpMizVGJTIvKqfCXDfTpkFh/ETtCoQIaWdm6WQG60UmUrCslnpu/pmdP5Uv25f9
         +j8ui8mQurbr/qoFSdcrnJEBAsHPRDtxCHOrIrpys9Dcn8MdtonGhrlutC16DKLMDBcQ
         zmrcTUQVCiGMuo/oI5tx1nzuo82XTV20HE9ps7ZxRcp5XUmSOI0K8FI/dH+i6gTHLclP
         vNZAG/CFlH/XeS2DEkpKOKzYaHGewW00UILd+Pl7vgd5xNPPw6lH6WMFux82U1cxKL8g
         meZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782471315; x=1783076115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zI4flamkvgrGWeOOrCKfSeqMG8hCDTFrwXFlOJzIeA=;
        b=JP0GdqYcudbs/2/v7+LbcGv30u3Gn9biF2WFxVAmsNOp5nhLORx+kBCzFZNIlnVROw
         1M2SHbaUiMjPm47ZbTpxE/eEXu5OU/UToKeQYPKgBC8wM34Bv6kjm7Kf24fJ3OuGO9GM
         05liXwy2D0cOHlI+JSF+0Pijh9xaFDMO+UqJRwbe2eYBWj2zZfsUX4C982oZ+X+UOSII
         t2vk0tO5Ffc/V/cV45jiHuyU4tR6SGYGsfwQeqNjjeltAQEs3+L/d6u4BwipuusNUwdg
         vQgbrQuqynoi2++NSy596/YNhvQ3OSsC4kDkFP7tWvqN/jyU5Urnj5ZTcaGmNK1iuNSs
         UFaA==
X-Forwarded-Encrypted: i=1; AFNElJ9PobRgoXqSVWxsNZyWnMJ/tSBmauWBLE29n/MmdTdR+wmSzcLS7yIbwU+WjkEiKDd3JGt9siyilYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJZa1KswrVpxQnQkHd+C8oAFNgWzCpY/63O3WdXjJoIOaaePc
	YMyQ9XnUbD0cnHfcUDVyuTc4rSu/Gp+/4eH/CUL16Bru6V2oQVM+Jpd9
X-Gm-Gg: AfdE7cklBStenA466DTqzRWW+ItU31zNUPiZeArpfkcwkLMdkeXnttVCMXg20Qqvg6i
	pdvUsDwV/B1iWRjo5ewDWzu/f7cr0V4TuHFWY373tNkZojLAa/eX1OjQsgkTRjjV/5XFuVifug4
	56pMOY3Jmd900LvLtoOpAS2UaxKInQcowrk50WCsrkQ6XSCzsKZFmWQ3EfQMXXtfUYZWoiC/BWa
	iUtF7bNrh6UF9E9ihQxr+TmCFsRDJrdNs4lU7DvoGQUZkiz8C4amwxizMMJub/TeGBr32erqMNa
	Ksu3Ju6eCLJ2umbYR9iLTo3laREfqMSfATtz9jWoysxjmWOxawrJsnHI3AmuQmeYWxspfzSZ+D5
	vZ5m8X/5ecAbx6a+SdclI8hoEtJswzndxtZphdGBzEmkqwt87c/rWHbvOOCFMg/6jPESyZixfjN
	ovKeHeY2fauqq/CgtFVU03ZLeILMtM1kR2dmPG37+czns5lKLQtw==
X-Received: by 2002:a05:600c:3483:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-492668561d8mr95736775e9.16.1782471314606;
        Fri, 26 Jun 2026 03:55:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268ff9f40sm69047585e9.6.2026.06.26.03.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:55:14 -0700 (PDT)
Date: Fri, 26 Jun 2026 11:55:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Xincheng Zhang <zhangxincheng@ultrarisc.com>, cyrozap@gmail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Message-ID: <20260626115512.5add7b23@pumpkin>
In-Reply-To: <20260626105723.42972329.michal.pecio@gmail.com>
References: <20260623121847.53749028.michal.pecio@gmail.com>
	<20260624070612.337013-1-zhangxincheng@ultrarisc.com>
	<20260625020421.2e577a94.michal.pecio@gmail.com>
	<178235378952.3114334.15752812276771065417.b4-reply@b4>
	<20260625191852.0a8d511c.michal.pecio@gmail.com>
	<20260626090615.616666b4@pumpkin>
	<20260626105723.42972329.michal.pecio@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2026 10:57:23 +0200
Michal Pecio <michal.pecio@gmail.com> wrote:

> On Fri, 26 Jun 2026 09:06:15 +0100, David Laight wrote:
> > Can you do a read-back of one of the control registers that contains
> > an address - if you are lucky the high bits will return zero.
> > That might let the generic code enforce a limit.  
> 
> Interesting idea, but nope. My VL805 with 36 bit 013600 firmware
> is set up with 37 bit DMA mask right now. MMIO registers read:
> 
> DCBAAP_LOW = 0xffffe000
> DCBAAP_HIGH = 0x0000001f
> IR0_ERSTBA_LOW = 0xfffee000
> IR0_ERSTBA_HIGH = 0x0000001f
> IR0_ERDP_LOW = 0xffff4018
> IR0_ERDP_HIGH = 0x0000001f
> 
> Nothing hints that the chip will truncate this to 36 bits when
> DMA-ing. We learn about it when it happens.

Clearly the only hardware testing was 'does it work with 32bit windows' :-)

	David

> 
> Regards,
> Michal

