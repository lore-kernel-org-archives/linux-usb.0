Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0971A304A
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764159; cv=pass; b=NXff9aI4XeXNlxV2zxyd9BDlMPSfCLdXSa7ubaQhNR9bpA2eJt5peCoovYP/WGALMzKZpuaIzt6qQ69t/rthdYcl+4eMoYJKYNWVJdtoEGkpNi20PmKh7vujom7Id7WmnVOAomUmK8cSX1vCZ1I9GgZBw3WoJGZq3/6Suj0jaSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764159; c=relaxed/simple;
	bh=t85yg/Fo/YP5BbPgldKds0/MaVsB59ympWpB9nRN7Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuTvj4qb+vSoJ8a0oG3VbsnsQepqvBBdGYNeG8MK48wxxfwltEMJB/Mm/gDno61WJBinAfhvSzrIMq/6DqaM4631v/DbtliFnVHiPF66OjUOFfdunAo64/dXgXnJeNPMXt4TEheIhwwLgpZ3Z+KvzzY1qcyoAv6PrN0NzdZpz3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwOtMOKj; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwOtMOKj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf52d15d88so27903495ad.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 06:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785764158; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/fg6gwZiKQIXhi2eBDW0CHyI1RkTol3330c6lnfYF591uDpw2sfDcdwawYUdI72TZ
         fKxRZG9nQf32CV1/WinMQkl3Ns21V5v+GacYYT2dBrD+QKAIafS5iMbA6lXh/IS8CMX5
         XnhKmUZjDApZ56ziYiEDcY6IWnK2eAKzwpxJr5sLcrBibehSzx5+79EF/jA4ilmHiNlp
         5zz1+d2GUPtyH8GITy9FS/U0k9WKCI9JH0mZuWZaGiSCZlHZszvDJ4G51kEXO4Mzleko
         H4h9xqGEfA8nkJM7UF9qsVFp0m8/tYoMBb48zg/MZEmhPV9aPcUC77JfY9JSt3nK/0QZ
         taPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3QWlOk2By1KnP9Sy5Ls8GThtRwGnTvLRYPsf2nIQ/Iw=;
        fh=lQzsxaqi0lWVej5GbiK19UkNs3xhkbwI/VwH2Ogxfy0=;
        b=NJt7kKxmQDPnZTCG1UycnU7IkWFAdreAsElRLxKa2iXl2i7fh7veskFq0sI6qgrnXB
         vDS35cMTCLtbtxCb1ygKL9CHOkPu20NayUUXg9js7ML8W6wO1icZ6czamEr4SfEBLi/T
         mrLJU7nzFd8uvsLb2BwHEL7U2q0Hp27GznxtkdIBzu9Qfrj2ofk9BFDv5WOnBjKIQlr3
         54xsHY2XDxQk5mZ6kp9Sp76uylbRHN/zncHXEZUEsrtBTUL/tI9repAsvtuaXUnGIbGu
         a1CSb8whnEg+y2n453pRUk0b475Q7/287LWD+GQLzNDMUmDGfdAAoe4v9oVKWbm54/Vn
         xYYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785764158; x=1786368958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QWlOk2By1KnP9Sy5Ls8GThtRwGnTvLRYPsf2nIQ/Iw=;
        b=PwOtMOKjBRgX36hEDyc+cKWmhUWbXiqSORDSd3nMyq9JuS1YWaD7CkPa0Va3kQuq+z
         0mPvQ3UdwF+JkVemgGIBr2kxfblRWRLs63Xbvghvd7SmVCRX4JS0Auru1KOoqB9vWg67
         icNa+S45eO6iypsacqiFwEtinT2mIH0ty/tLcymP72OcT3vYm+3dFmDZ7JxL78cyLeTI
         fE5zqoaz6JcxK9dudQ77seoT6MGM4mnjPeVeqDgOFSkBD28YGR83xas3mElSjLBze0Kv
         aIC0H/hxdRFc6NaPVQumukzdWKKDh+CDQDfbfHXkhTgq3KHne6CW/e5qx5Ef0bB6/rHq
         i6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764158; x=1786368958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3QWlOk2By1KnP9Sy5Ls8GThtRwGnTvLRYPsf2nIQ/Iw=;
        b=LcnwCkw1mDXxC5W9kydKtbFAhJyU9k1kI39bKQXdlV4KfbNZeSuF7B+RTQRb7i1yQA
         LEru6C/I+mTuFPNrCsF6fQqeXSvh/bLpojPdiKhB8pxcZU7m08tVm7AudXrOMTVD9HSV
         sfbTgxB58fLTEs/LGhXrbfxHH0+UDmvyhK/F8vMs5n91lMwerJiGmkLWg3LOmEdc20jD
         G85cpb/FhFrXZSIheHktXxzD/Ok7nAFooKMbHQHxtpFmxIWeN8xHHn6BblEEoOESM33e
         BRoZDedJao5n4v/R5i5bIPt5ED8AMBMh6niJvuZGiAWHx5oziRHz7RW8qOLUjlCFkUEY
         fAzw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0S3W5ZEYRx8Y5mKO5vWowrVVv1MEKJRQfFspRNx0e9G9rTGSYk5HiN1975U8TwBN6xZJC8TjoqEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytYceKhgDWiJ5bZiUyLhBLSo/kTKBXpw8XQl2AdGFg/EqF5d00
	WTYgENLVPsqgMqVlu8VQAo5M+mKqWBhSAgVMPN5toaTYhCHIyaLDcJPX1g2hzIMYVfVNV81S5KZ
	O7aslSDj1wW/exrzNJjDz54aRdoCLEoA=
X-Gm-Gg: AR+sD10T1pZABB78HvNcfllBZ0hsmpKnoBRHUvbyABynFVYXYaAe5uysz1ZyX68N2mJ
	5FWgCOFVH4GN53oh9T82PU4QkN4frS/37rjxQQb8Lc97ybYf2fi/qlaHqXx0llw3TxI3oEoR1fc
	BBICmpmWhR1e4PyeHf/zf1fWvLpjb4lMv2ZtD/Km9fnwWxAuGrIE0WnN2wpqTiYNNBQEKhnvBIb
	swxJcJmbbex7FVZBGj6v1ef7EHySfj/Yy0vJzgsCGhCN2dNOQbqyYNbD2qYrPfoAS7pZuleFlOo
	ujw4PKJPKe18obAvgKM/2Q+Js+ToSDs66Ky4XYJZRT+I1g==
X-Received: by 2002:a17:903:37c4:b0:2c9:c952:6e9 with SMTP id
 d9443c01a7336-2d052188df9mr106729265ad.2.1785764157462; Mon, 03 Aug 2026
 06:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803110704.381-1-strst.gs@gmail.com> <67997c70-d77d-4ede-a461-c80395e8a0b9@linux.intel.com>
In-Reply-To: <67997c70-d77d-4ede-a461-c80395e8a0b9@linux.intel.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Mon, 3 Aug 2026 16:35:46 +0300
X-Gm-Features: AUfX_myEt0hNcyQzICduGELJYQMcgI-lAve6-vXONl8Oh1kZuluRnXrQ0URTIJM
Message-ID: <CAAsRjRk5oGO+=YEHxdDBxNAVi8cdeP8hq38NPKNfVYq_DN-EPw@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: Handle USB3 port events when there is one roothub
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, hkallweit1@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 8/3/26 16:13, Mathias Nyman wrote:
> Is some other host controller (xHCI/EHCI) handling USB2 traffic in this
> Broadcom Northstar case?

Yes. The SoC has three separate host controllers, each with its own node
and its own driver instance:

  ehci-platform 18021000.usb: new USB bus registered, assigned bus number 1
  ohci-platform 18022000.usb: new USB bus registered, assigned bus number 2
  xhci-hcd 18023000.usb: new USB bus registered, assigned bus number 3
  xhci-hcd 18023000.usb: USB2 root hub has no ports

The USB2 pins of the physical connectors go to the EHCI and OHCI
controllers rather than to the xHC, so the connectors stay backwards
compatible and the xHC never sees that half of them:

  usb 1-1: new high-speed USB device number 2 using ehci-platform
  usb 1-2: new high-speed USB device number 5 using ehci-platform
  usb 3-1: new SuperSpeed USB device number 2 using xhci-hcd

Both EHCI root ports are in use there, one per connector.

The layout comes from bcm-ns.dtsi, so it is every Northstar board
(BCM4708, BCM4709, BCM47081, BCM47094), not just this router.

Thanks for picking it up.

Semih
