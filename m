Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772504;
	b=1CyfhEAq9lMqCleVDe2XAGGD4JDzCzHp5bpRUOMu9VOgv7Ylv431Pv8gq5UxMlEC20NJ
	 +prPk5WrDTKq9FsFm0dIh0PoVncLFT9veHMkWYz/MFq5yBC6UN56fvc2P/gC7gnaMm8vm
	 BBsAjBwvue1CTLzIX8k0Sg2aQbDdPOIlS60Qt0h94GgF9X4/R4mmqjJGD2hdbqUvmL9Tf
	 /A40QOywefAnAK9V392IBqBxFT403VaSImbJ8zaxa1bl/VF4vtobs4Tagq0vTDXRcAppQ
	 wCocZPkFW07TtSaL2URITTTtZHRfb9s2ccfhk9Yk2tsIzc5oLbnYzV/ii9tsAXIKp+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ObpDvAOX1klXfqsSNdhdP4hJ47WYvmcb7PIfyXC1CRw=;
	b=yFZ2uoN872vSZ0NzeagODDfKRl1efgcL3o/mitnCxChw9vhg5MTHaJH/B8c9/ulXWEyn
	 Kx2o9gqmMa80xWtmoqCnmf5R6qIbxIU79M0+JhQVU7WExOoFluiinRiWnZhyvCWBiClqL
	 x9kQa/Ye3/ce69XF6puaHVqbfAAk+aoPfc7cSyaTiNViHce9qjV+Ny/RdVYOi7TG/y1ps
	 UQP8i7dkWAASjV8k/XLh4vDO0yFoNr7UmbeyvV0EPO0L9ZcXEfzs0vWyjghw28o6F5F0E
	 4ADleJrnp1xcaik9rC9UBLnhataY3JgdY5l+gut3w7CqViUcc8K53Po3UaKv/OdKksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhBIX0dc;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CAC606A31D
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0CAC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhBIX0dc
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e00eee27dso707102f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772502; x=1793377302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObpDvAOX1klXfqsSNdhdP4hJ47WYvmcb7PIfyXC1CRw=;
        b=qhBIX0dcQktnNgcuhUOneFmHnNHKpxg+fYyk/FDPz3ae3Xmty8XA9sE9NJ4+d8lNC2
         ubukkbO61AOfg50nn/TawWQ22v/v/uhgB/q79lB1085dthU9oFX8QUCkem7s53SLDra7
         9xNt6zmk+iS6vIgX33fVpkylI56664RooxqhLUp4Ljcxz5ZjikQeNCpwBr0J7y+R7cy6
         OvPIKf3vkIdMe+0ldpc8O5maz3nEGV/qAq0q5KOT+x5x7Bed3TeV3b6OHgC1KzgkmP+H
         QzUjSQyigkx3VCU5aDPu0ZliEEO4CjZHH2OBBURVgloB6/+5apqO/Qu++l+c85QlZZxZ
         gfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772502; x=1793377302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObpDvAOX1klXfqsSNdhdP4hJ47WYvmcb7PIfyXC1CRw=;
        b=EoKBYeycScv6BWbVwnBStqBUf09uZ38zNZc1j6tpDZjL1kabD03KfU/RtLQkUSItvC
         AFpjdjvEMoX839yMrlsGUH0SMiNAoZFsdUm+KNgqxVVcSpSGV7m2+g7EWwjK6deTrlTG
         JlMMo42iEek5Ig/zEhg/1fXfvfDVbv2rtzPpaNELMu+jWyO49bzQMtnuvWpG0e4oA6Pq
         m/AjYyV5zLZt9ghg+u2KlsQZp47vQYPk+98tRyQzgsJhrJD4tw59UC861wZEAY57jVs2
         jCGZU8eQGm1Jk3mtStYf8laJIFZO1QbR+vUq/AEp3QaL0iIWIpRhb6AHMxFiN3cPLi1J
         EvDg==
X-Forwarded-Encrypted: i=1; AKwUvBzeG34+CTj+IKY/aSStpOz/ZeFhccH1f6pYlQR9QubYclzl7pYqlMyb2cqOirRGrsWwc9PkzuhJLCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7oyD74IbalZ33GhY5wuiDuuS2J39B8E8K9SzUfYO2txxIrBtb
	/Q7Tizd9ggZZQfxDMhkLR0uhVMCVlpXf0ACalx6U4PBhE80UJtsxzaRK
X-Gm-Gg: AYBFou0RgJRyMzvokeP0xhMy1OfAulUnMk7CfCk3/swpmnscXhuIeIQmYkKp81qulvK
	UhlqqfulXLPQxWqo1Z0fkIyIpe80kwdlZJ437PJEAZDEZuztMTe0E1+qAHGGXl8JTbxiaVPC1lj
	FVMT3aO29U4tck+Nf32hkWhDcVgWgFp+YsVQRBl3JA2jfOgEB1R3RjrRZDb3oGcmF8Vud/I/9XC
	z4gNleFe+5+zci1+bceEGq6kkiFFoZiYRgzlRGpyLFrzXlEnwfD3dmlSjjnezyW3PhIeTENKonU
	BevECETJUWztVgu35FFcwupooAIVR0Dit5XvLQw/ewLqI/1hiF/GmwwwHNsxmmgLNjBxa0yAlGD
	pfxOx2MJcCRcuGXywSIWfo7o4Z9aydozkuCFUVN1TcmkZsz7kSD6SZPwZPVDemUjhrauBDXhfTr
	h2i0dDyK3ZpSxj828OXh7m7+IL6m7wveEDTCAwfZbK/ejbFEFw+yFqMvN5cjqO+Xl74deLOz/kt
	qtcbqLFXtQsFeRevXbKyttF4jHPSGYQ0RC9D2zC1/Fl23zGoQcOwDDxhGuMqg==
X-Received: by 2002:a5d:64e3:0:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48e385a6690mr4354135f8f.27.1792772501780;
        Fri, 23 Oct 2026 09:21:41 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm901583f8f.8.2026.10.23.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:21:41 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Krystian Kaniewski <krystianmkaniewski@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-usb@vger.kernel.org,
	Brian Ellis <brianellis@gotenna.com>,
	Johan Hovold <johan@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	aichao@kylinos.cn,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev,
	stable@kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2] usb: gadget: u_serial: pin ports while TTYs are installed
Date: Fri, 23 Oct 2026 18:21:39 +0200
Message-ID: <20261023162139.3308-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022091359.1187468-1-krystianmkaniewski@gmail.com>
References: 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krystian,

On 2026-10-22, Krystian Kaniewski wrote:
> - Do not carry Mehmet's Tested-by tag because the registration ordering
>   changed after his test.

Retested v2 on a Colibri VF50 (7.2-rc1, ACM next to NCM) with a 3 s
delay in gs_close(): freeing the line during a close, opens of the
retired line, re-creating it and 4 add/remove cycles with the port held
open behave as with v1, every port is destroyed once and there are no
new kernel warnings. 3000 opens racing 30 creations of the function all
succeeded.

Tested-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Thanks,
Mehmet
