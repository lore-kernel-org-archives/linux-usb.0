Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511138;
	b=eH7E0VZqs9PMgkIr8qWHIqqJkvoU6De6QJoCKEN/lMcNgV4Pb9LPiy5144D9Sp1yGXeW
	 UoHTddob14DBthPNamr0LGyYZ2ySdYx658eHgsqRqVQjapZpQhEtO0t6B85jgolV1ubIo
	 ZQfPQwleHDEY/CKgmxiyhmvnv4vdGFUCHUignQ3PGEQO3puVdBvRGUNgUWyfUsIjy97Zy
	 DmdkqEwDxzxUaLAHqmdTEtQmz/5j3wk/C4Zd2eY5Kwy2gUhfzcXAF4ORM8/Fr6uNz+wb8
	 890UQgm3O3RpFTWrrHOeHoEF4yVKQ/CPJvmY0N4CrzQ6qI5SBw6N/RByr/RBoJJvK0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=oUhbWP+xO4Xwp6vLYbQPz0V795zRUvYieGT7E6JzQ8w=;
	b=3cwMUZfj2uTNJ3sh/jLiNbr+6NPgP9saa4N9ZdspVa5MSpvOwzyTLkHlaZurY5E7U+jk
	 yWCPpfhnRfDIjxDSieC33A6rSnaAPohgDK/NsG35nUFmsf4jVx9S0cHuuvr31PKWxsO0N
	 CXKswy+RFiOFCbrY0NqdqAp+GgWuJ45VKDp7DzFxK/fB6OS6MahS5P6dbDcxK2QPNz6O5
	 gm9qMuLt12MVEN3Z7+pjiAhIfHuTDycf5etNPYY0+s5PWb0zSpTOFwYxEBbovbbxYec1G
	 nN35gkBGfCDEK8VZiPa5S+Cy6th3WfGlDidv2KF9s31yruXHmGWpBUTCV3npqPtnfbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ej8oTcel;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AF5606A8AE
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 19:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AF5606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ej8oTcel
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e987ec84afso1318865ad.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794511137; x=1795115937; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUhbWP+xO4Xwp6vLYbQPz0V795zRUvYieGT7E6JzQ8w=;
        b=ej8oTcelsuxDZjwEAidMbY9rbmtg5yRfaMBEc28Z2tLU+4A2XWb8VABD1CT+D2Yi9m
         354ilxe2H8hvV4iE549AjneiNHzyT7OJqo4prKUQiwBRD/Q6vPWEDBmV1FeMePtmce9R
         t7Kt0t/Xl+Dc6orqritJvaXlQEDqBcQ4AEFFTm6M2Nl7ESYQHVIYTrR9mLoNxBGiXCUx
         3CwdU6zL26USwaHCGuIoncQIO+0tL6rJq/nfoKTHYSJ3pDhBQc5+9MwJYyAHf7XyCWey
         2fzWbiXdMhJ9IHk2dC7sYPIT2V106tMj0ag1SxOSYfh0FyN9hA/McLzOe0xIYqw0BJsO
         33nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511137; x=1795115937;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUhbWP+xO4Xwp6vLYbQPz0V795zRUvYieGT7E6JzQ8w=;
        b=vXzgQF+XRZk8oUdgtFKSehxPZnI2SgtYxrLdCRq+O4psavi6EHdRIxTU7fSgv+MMBs
         0w7Ba97sMfO5RWuHz/v4vFa+VXJU5ImB/Tl3aoJj16mgES4qfgkx9qu3LlcG4/FDewvG
         E3xb69GjI3TBBZ0Zi/62J78Ylh44c3Jm3K0oBx3VwgnIcvB4QVWNAdcvolimTDYTLY7q
         HzdJ3ALaN63IIPEJFd+RvUWy1TdfG2racjxlk0LbUI1Bg8F82zu8EKvSPBuZuDdeUkK3
         qJE1ji9lKvAK2thQAfjL6YF2EM0BJ+lJS1YktyeA29gVxyuzY5gG01cn+lqTnFAYbeHf
         f3og==
X-Gm-Message-State: APuU4Z/5keUBP0GKeRAYA6L+62jlpvdklmuvT5aLnaWozGMIxeZXXU3M
	KT7PhAP97vc5htV8dxoNFU2ghey++Yyr47uAzWUVSzCjRnXPFm4I+vRw1qb+D6LMHj5qrdRUkdT
	2B9W4R3nPrQ==
X-Received: from plsb19.prod.google.com ([2002:a17:902:b613:b0:2eb:162b:6e4])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2a85:b0:2ed:eb27:6c5c
 with SMTP id d9443c01a7336-2ee0dca8c24mr3309075ad.50.1794511136836; Thu, 12
 Nov 2026 11:18:56 -0800 (PST)
Date: Thu, 12 Nov 2026 19:18:50 +0000
In-Reply-To: <20261112160448.41566-5-lui2012qwq@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112160448.41566-1-lui2012qwq@gmail.com> <20261112160448.41566-5-lui2012qwq@gmail.com>
X-Mailer: b4 0.17-dev
Message-ID: <179451113093.3909038.4032474606987042553.b4-review@b4>
Subject: Re: [PATCH 4/4] usb: phy: gpio-vbus: free the interrupt before
 cancelling the work
From: Neill Kapron <nkapron@google.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: linux-usb@vger.kernel.org, b-liu@ti.com, gregkh@linuxfoundation.org, 
	nkapron@google.com, tony@atomide.com, bigeasy@linutronix.de, balbi@ti.com, 
	shimoda.yoshihiro@renesas.com, robert.jarzmik@free.fr, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 13 Nov 2026 00:04:48 +0800, Chengyu Liu <lui2012qwq@gmail.com> wrote:
> gpio_vbus_remove() cancels gpio_vbus->work while the VBUS sensing GPIO
> interrupt is still live: it is devm-managed and freed only at detach,
> and gpio_vbus_irq() schedules the work with a 100 ms debounce delay.
> A plug event landing after the cancel re-arms the work, and its timer
> then fires on the freed gpio_vbus_data.
> 
> Free the interrupt first, which also waits for any running handler,
> so nothing can re-arm the work past the cancel.
> 
> [...]

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
