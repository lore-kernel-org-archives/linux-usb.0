Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511137;
	b=zsZMXjisr6BJM0DEuxJaP9Ky7CTqbl+Yji1TQJ8SQCaDAV0m5/BAymPG0WnSpuhAi29r
	 eqw4W3AEBYOoLQvhmODX7pIopEE6+9VuQQ1LgKZogLaApozWfkJ6PSCFLqFeZjSysSqfY
	 IyGJIBHVrBa+xwo9FW8CbreY/c9y6OGLRd9ysxgp0UR6GI+FZTNJZsO89GTE+mH0r+5Y/
	 OItXfg2eCKeBNz2weHWnLEzltvWzyvyITX+KOjQuuDSWriIZaEpHnffEazlXXCSF9rpId
	 /9ozCz4jI62oh8Z4jGj54PdYjWxJpMEnQmgKT+8AtPOlNeT9Ysufu+T/Oy28wDnaLxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7LCfS/9rwxDTKWh5ZrMSShB8a9ZcGb6m70vtz1Y3Ey8=;
	b=UONj5FDXW3fe/A9y0C2WnMSy+5vB9ve64rj5mTQt4PDN/hykRI9toOWeX02s4CjA8hCm
	 To7hz9sdDaYJrkMEqAf0mrjvmSy8aXrYIyGKrP2yta8M50rIoI0ZQpM73jmv05OKgqmNY
	 1SnapWFzzAybXeD9h0VUNtsTGBgbBZ3fJRn5jm+HDOauTe78gL7Ozrf9BngZmu3P8ombE
	 ogDykmeTTi2sY99rryVWNTR4eicu/Z/e16Jn/YSIkILRX+f+9F5AEUqj3JK3utMz6Wb2R
	 Ye5cG/3OelTkN6flEJcABAZlx2OT8aK/fbuHOehaHBR/1bhrOXLf6n3eH9mnQIdQ+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cX3T5FnK;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC90606A8A5
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 19:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC90606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cX3T5FnK
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so2299375ad.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794511136; x=1795115936; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LCfS/9rwxDTKWh5ZrMSShB8a9ZcGb6m70vtz1Y3Ey8=;
        b=cX3T5FnKUMfbrTjrPTh99cQ79TGan5Z6s2UUOPVu6OYyNdnBKi1By/mEXCSuIgMpXq
         BEMZMcu9EdYn9uwn8rkiTgfa4Q2NCf4bl6YbtJJ6Efz95GoLI9+e5G4Hb52YpDyz8AVj
         Arjsm365XfLH+T41PgGtBzouYbnmfkUfbvpzGI8Pl7W3WqD9iEkq/qtLsHX/njVwhve+
         vThaLGQuUxii5CXTjvNhbJOXC1Zm1exUHk0SrqgevjfSQ3x4Sb8I1pVjpfu0lmpmI8To
         okadTTfHQ1JL0IC0Nr5njNWKeWjdrVN1o0ZSgcMSXNAk+Dl+zNzzNWIDpeVL0xaJRLGt
         v4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511136; x=1795115936;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LCfS/9rwxDTKWh5ZrMSShB8a9ZcGb6m70vtz1Y3Ey8=;
        b=JYCwfYlA2p8hTJIANb+ZIT06ZQRonez9B+Cw0NoPwr2j8+2Q3n1TzY5euNa+om6cG/
         0v35pqELTau4id5LORZ2acy+s2LPMTbiINS6YX+T4g9QLI8x+CxnK9yatqkbmOGWi6/U
         U43YScCutwix5gNsJPwjp3PtNCsEipr8JhcTUBwm7Sug5KrKFwCpkQlnrOnoOQQ+WvH4
         I4g5Nxudy3RE0UDQvxQjCcx5MYs4aqwoQ0T9XcOAZT+MwOVE815l/iqlcqQiirfHK6Cp
         u9VqsCJmX1xYYgtXJUskOMoDxJVae/LyFn+H1UUdtQQEG2lDoBhY7jofbgBgwo3FbMnW
         OSOg==
X-Gm-Message-State: APuU4Z8nMJAioa2NMKcSw/LcjlBy7+tI+9qxaK+f1xl4Gr2zPjydHNnT
	aIkXG84Z69UI8RiIMVeKRJ7LeQvC7F+9NmF+VXQ3n81qCAZDb/eYEX1hHqrklN4YGERtvbgQubk
	5qNMmdhuHsw==
X-Received: from plqq10.prod.google.com ([2002:a17:902:c74a:b0:2ed:de1d:fc13])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c8:b0:2eb:4a05:4b4b
 with SMTP id d9443c01a7336-2ee0dcc3023mr3285625ad.49.1794511135954; Thu, 12
 Nov 2026 11:18:55 -0800 (PST)
Date: Thu, 12 Nov 2026 19:18:50 +0000
In-Reply-To: <20261112160448.41566-4-lui2012qwq@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112160448.41566-1-lui2012qwq@gmail.com> <20261112160448.41566-4-lui2012qwq@gmail.com>
X-Mailer: b4 0.17-dev
Message-ID: <179451113093.3909038.18000407710443328258.b4-review@b4>
Subject: Re: [PATCH 3/4] usb: gadget: r8a66597: free the IRQ before deleting
 the timer
From: Neill Kapron <nkapron@google.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: linux-usb@vger.kernel.org, b-liu@ti.com, gregkh@linuxfoundation.org, 
	nkapron@google.com, tony@atomide.com, bigeasy@linutronix.de, balbi@ti.com, 
	shimoda.yoshihiro@renesas.com, robert.jarzmik@free.fr, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 13 Nov 2026 00:04:47 +0800, Chengyu Liu <lui2012qwq@gmail.com> wrote:
> r8a66597_remove() deletes r8a66597->timer while the interrupt is
> still live: the IRQ is devm-managed and only freed at detach, and
> r8a66597_irq() re-arms the timer when sampling VBUS (VBINT).  An
> interrupt landing after timer_delete_sync() re-arms the timer, and
> r8a66597_timer() then runs on freed memory.
> 
> Store the requested IRQ number at probe time and free it before
> deleting the timer; freeing also waits for any running handler, so
> nothing can re-arm the timer past the delete.
> 
> [...]

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
