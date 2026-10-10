Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B6E270EC3
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 00:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791592519; cv=none; b=G14c5PIHOXqTBT6YQHEsPJGN6odsmnt8RJiwuWRXqZLcsyW00zGmIvMEmAlJu5QCYCTPNWUDEMGkxMEeEHcgY7q8ByeqCo0A6QO8YHs6lCQLPaNW2PmAfZ4Nq130Fgta0rDfyRbEXkJp0cLBrtq/6wrSvxDMMesGiqweTMH+RkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791592519; c=relaxed/simple;
	bh=IgFB88Fae52t0faG3mtsC7gchDUT3CA1h7QB8FY2kik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rc9y2zEQd067zWFtzURyiaw0wrS8yYdeysnyazne7GYmBgc4VUANaM69EzKtTTWZ8jSHpWgFhZsanLgEEgaFa9NFfuLZ7a/3GFrSmWhmSuWY8Xp9HWE5s/0ETJQ2+Pl8437Oo4KDakOi+N/xfZasFKL3+chroX3ocRNXj12voJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMpuP2lu; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMpuP2lu"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5d7daf06158so100015e0c.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 17:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791592517; x=1792197317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgFB88Fae52t0faG3mtsC7gchDUT3CA1h7QB8FY2kik=;
        b=OMpuP2luIWUXSOokqFYKskD1vtICaWgfVYyARPfzweGhptCVlmNybvwaI1CIUZam4A
         ruMit2hLONXcXt2k71vBVv9hXEaqtu/e/D41uWkp0UCse4BjPXgcBiRTBBRW7hp/24n7
         6AX2rMsrF2y6oQwLctFLsgicW/OWpeYfAvY48u0d1Jb4flgwOUaTFTnd5ybAQ6VB11el
         GpGq1trMQUoy4DgrS5/rTJMvfHkYfqWeog6wDJVYb+Q6FFmeNri4ukAjaHpRftMFLEu/
         ofylP4Kx9iKqsc8tQ4KJcgK7Xi6qyDCLdRZH9aDKFSr5Aj/Ow2GP9mOvrQl5+dvg+uJm
         MgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791592517; x=1792197317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgFB88Fae52t0faG3mtsC7gchDUT3CA1h7QB8FY2kik=;
        b=ORVXX5WzG14EPtdmfT6qKwx71qQtjthA7F9nv/7HzYt8epofDqzqyiI+Vmtv53ViGG
         X76rYYIv0AhRirK/DNUKee+BueQdIMEZDzOLYS6gw72VsVgaIfFOupXhXxyz0l4CIVqp
         +Tapkt1YlCeJGbzoqJDWzQhVmXQk3WdxKAaufEWKxNiOzwVzAFzR2HsWEB9Am2Cy+NYq
         qR8ROjXYQLl6MYy4zK/QUQbJch+OakzxLIr83rfbkalCL1NpnLDYh3HOpsf+uC2kIfGX
         HGw+ucrX4mZqgGstO2IMAbsu2ka6vZaGl3zLxPWgtPALbhvAYNchUzy5xdpBGLJTTfVH
         CNow==
X-Forwarded-Encrypted: i=1; AKwUvBwVSbq25nVUo8d0SuNocu6Lb0S4MdASunp9o0UiVUN+3z2S1OSMwS1bm2WAweMko7wpfK6dl/XtoI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9cOr7ZdLlNUy1MvZkiuzRWA7UIW9iDOOwLyBXHO5QolD59fCf
	AJybkxFuTjXr123s61W6OcEfk9zR6+os6B4zQXl6TDfoGlnjkegqvmEbgODB7m9hUWPJuxuK
X-Gm-Gg: AYBFou1MISNqBd0LQVIFHe3Mo7+qkjtxmJ4NbGDTgs7H271+mAS7LnowMLZ6vbsd6FU
	ab5Ta79ozu+4e+hs0SJOV6NphxLP8FxkZtbHxaTRqhzeVvyXm1hk9wwMC9rXjMaPoTmNXuYSqat
	ROZ0UC6Jo15aSWfvdEMbRFA5hoe66IywrFanfQF5x2Efon9KCjLY20AMf9h1VTW/nxUCt/80hqr
	JKXdVfGMAyZmrKwukPyjMMwIlS2xR+KgXtCQoChUB60M8YkQhTpF6cG5A32c6mTrxTpRN7g9+mf
	w3+43Yeau3tiFHrYL8kEOzl8pB7v+z71c62Mw3EiCA8jOFONetUD3YjEfVtb95uvVCV5LnA1G04
	BN+F9MY7sMbfDzchp8tYSvEc2u7shJD/Xvg5cD+iZ798zKNdSkuT2uPe1mg5po+kaDi93Ex9CwW
	T0H2znXGkKVZ6BSvZwyxbFf0K+CGOB1Dl7Bdw/+crq5O4lYZpdKsPDDshzBG4ZEYU=
X-Received: by 2002:a05:6102:a4f:b0:7c3:9059:49c2 with SMTP id ada2fe7eead31-7cb373593a5mr948439137.22.1791592516863;
        Fri, 09 Oct 2026 17:35:16 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990138f4fe2sm1209146241.6.2026.10.09.17.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 17:35:16 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ijae Kim <ae878000@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: m66592-udc: Free the IRQ before unmapping registers
Date: Fri,  9 Oct 2026 21:34:54 -0300
Message-ID: <20261010003508.2730761-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003034908.619696-1-mhun512@gmail.com>
References: <20261003034908.619696-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026 at 11:49:08PM -0400, Myeonghun Pak wrote:
> m66592_remove() unmaps the controller registers before removing its shared
> IRQ handler. Another device on the same IRQ can invoke m66592_irq() in
> that interval, and the handler reads and writes registers even when the
> controller has no enabled interrupt pending. CONFIG_DEBUG_SHIRQ can also
> invoke the handler from free_irq() after the mapping has gone away.

Confirmed against mainline: m66592_remove() calls iounmap(m66592->reg)
before free_irq(), and m66592_irq() takes m66592->lock and does register
I/O (m66592_read()/m66592_write() of INTSTS0, INTENB0, CFIFOSEL, ...)
unconditionally. request_irq() uses IRQF_SHARED, so a co-device's
interrupt -- or CONFIG_DEBUG_SHIRQ at free_irq() time -- can run the
handler against the already-unmapped mapping.

Masking the controller's interrupt sources (INTENB0 = 0) under the lock
and freeing the IRQ before iounmap() closes the window: after free_irq()
returns the handler can no longer run, and every remaining access still
happens while the MMIO mapping and private data are valid.

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
