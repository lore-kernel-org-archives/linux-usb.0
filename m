Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA3632B113
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642445; cv=none; b=eTbALq5sW4fX7bfC+zMKke8NHLVLPGAlx3e091Tn/3Q5fKHVxyWnj6b93c3WE19zI2sPHqnDDU79rF5YGGpRRFs5MXJV2uKDFh5Gjz9P4TAWbPiDp2LvR+rbq6iMXecM1slvMkvv5SIYd+VRqx1HtsXN4VmpznQEBH1d/c5EAaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642445; c=relaxed/simple;
	bh=grRLkJN+Ko2Iz6fCDMiPUA58aC5KdZux8G0S6xruiL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxpLRt3+Y6O3KFUmfwuBF7SxKTcmptnrxgPMT8UqSEwY+Y0buWFK79+Yfp+QrI7oqxunlmrWae9Wxn3gUdwl6/33P7rlD78rMhFbbO569P9sTyydAk/HX5yenpoKDiCSAKq2/F2UQpWgN4bIzKkR+VdXGgJF22ebT1Mwe69qNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj0UsI06; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj0UsI06"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5dedc4e5cf4so556843e0c.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 07:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642442; x=1792247242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grRLkJN+Ko2Iz6fCDMiPUA58aC5KdZux8G0S6xruiL4=;
        b=Bj0UsI06z7aUcJA5nA09p3p0HYcZaakQ81zaETq0RVrBVSaC8d6c9UynDdmkUgon7t
         GjGWSfOhdofYP16sIroNbuoFJUtx4NWM/RNxfXYVzfn9+3bJPDBMDzLycTmxTy+u9nUP
         zHig3c8e604G23R8iGfhr0T4hnuc5HYipd1SupWbwutgaMgpRqcgGQAOx/gsF2mfhTX/
         /cks0RxV6lxv+/4iPFWkLhXmEkt1sjZiQ+XeBaeDR2mj7p10KPs9DD+TTBhwDMytFeZq
         wsA2MTXqXupqdVMdYNBCXuMkjVBCpUasrw7lMcVMRN77JlZYBTgXv0xvcYJUy1CX0Lzb
         0tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642442; x=1792247242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grRLkJN+Ko2Iz6fCDMiPUA58aC5KdZux8G0S6xruiL4=;
        b=ZGQyffcoeAcQAJGzCUKDhBafW8z5mbmJYH6i739+ButI0MXl/IPzeMQAUESVHCR3zx
         qKWzoyIQtrbRvvQfoaTfoS9GcDHSncVBRPB/2Hz9B79fgPDlo8J3SdPK0AMzhKX5W0Zr
         wwdomm/xiGBu55gjlWelL2C9FXW1sLnnUX/1HExMOTGwlwRJJKcehGY3pRaUhkW934Ee
         UvoQS5LdzV2FnmyrXQRskGz1kFrkPlmSJL15CnZnBr2TtxLxFznLRao5qs4rYH2ylIg3
         U4dhUQx/D0FJEIFJFzCKs2+2A6pnbOiwMQvGDmlvP30Axq5M1k+pycB53zEKxbzl3wHk
         Q/Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwNJMjVp7J6gnUVBgRr5zHiEWoBvE4ZxTxt53zlSDFnZUeRmeWZJ3EnjqYywd17k5338jtGkLzDz2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3iXBtXVR4knfBk/KZK1scRAM85RY8pg93zzn+eoRi3F6e+VCG
	jwI06Nb9h8CZnyFJvNbRXHbOOGwGaqrTCI6yS+6Nz47FfHHGq3Q5/czVbMn6BEUxEr4eyVLs
X-Gm-Gg: AYBFou3aCIOR7iEw8khYZd4xG9tou01RL19JUS7oxbXHi7uWSGun9Rdq/DNJPoAx/GY
	EyL/bxxdv+QeuRH2r1DMwOCZz2diyu5TmF3DpzLAUQxJG8PzNlmZaLA530ovO+mJbevLbE1iTKm
	zN3AC/WdccPuTcTtutOKMEJXYNRaPt3xnZtn1LAkxSlPRnLfP6KY3ZqtFVUg0CM1/Ol6dmpcBwv
	+VWHj21JJ2UhY/SV6I8vQ+2R9Tby8i5LGbm1s321HvE7pXvBJCWZsEPJV9nVrCdfsSPYp9AjKe+
	rxoKVs2KNDoxc9h4aEZzUs/zVjq23G3pGDDhQjGCD6gqFqa8TW4MxtIcuqhSPmCmmDnMHPk54U4
	hBDqGUGEuMGNxlalbcCLQat5LI0pRp5BqzeDKvM2OIac20TMGgrFZ1gD/MsVTZQv8T9oNScKpU5
	Aqm9WBUV1KIJ6FYA9PFewIPpvL1h+nzMHeUF7N6GoMxCNuBxnSjTM1fbqep0yR+E4=
X-Received: by 2002:a05:6102:9d6:b0:7a0:eb10:79b5 with SMTP id ada2fe7eead31-7cb37231b47mr1812789137.10.1791642442468;
        Sat, 10 Oct 2026 07:27:22 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb3411becasm3854339137.0.2026.10.10.07.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:27:22 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Faqiang Zhu <faqiang.zhu@nxp.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: u_ether: Protect dev->gadget access with dev->lock
Date: Sat, 10 Oct 2026 11:27:07 -0300
Message-ID: <20261010142713.2667481-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923-u-ether-gadget-npe-v1-2-ff466c55ecc0@google.com>
References: <20260923-u-ether-gadget-npe-v1-2-ff466c55ecc0@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 03:58:36PM +0800, Kuen-Han Tsai wrote:
> Extend dev->lock to protect dev->gadget across gether_set_gadget(),
> gether_detach_gadget(), eth_get_drvinfo(), and rx_submit().

Confirmed against mainline. The race is real: eth_get_drvinfo() runs from
ethtool independently of unbind, so its NULL check and the
dev->gadget->name / dev_name(&dev->gadget->dev) dereferences could race
gether_detach_gadget() clearing dev->gadget. Holding dev->lock across the
check and both dereferences, while gether_set_gadget() and
gether_detach_gadget() now update dev->gadget under the same lock, closes
it.

The rest holds up too. In rx_submit() the cached g is both read and
dereferenced (g->quirk_ep_out_aligned_size) inside the dev->lock section,
and it is only reached when dev->port_usb != NULL; since gether_disconnect()
nulls dev->port_usb and drains all I/O before any gether_detach_gadget(), a
non-NULL port_usb there implies a live gadget, so g is valid. Clearing
dev->gadget before device_move() in gether_detach_gadget() is fine --
nothing between the two reads dev->gadget and device_move() does not touch
it. No lock inversion either: the sole rtnl section is unrelated and never
nested under dev->lock, and the guarded regions only do strscpy/pointer
work, so nothing sleeps under the lock.

One note, not blocking: the struct comment now says the lock is held while
accessing gadget, but gether_connect() and gether_register_netdev() still
read dev->gadget unlocked. Those run on the set_alt()/setup path, which the
composite core serializes against unbind (gether_detach_gadget() is only
reached from the *_unbind callbacks), so they are safe -- the comment just
reads a touch broader than what is actually enforced.

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
