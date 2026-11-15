Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780189;
	b=FCcYuGsyZyzjNgvGBY2Xq4kDgEfxLfTVI+gh/fdPgUtJ9D8IH+KFJwY8FYVCSg0i4YIr
	 bQ9ct2jDLodIxm6i6up1ResNvIe7xq+YTV6Ow4JNpzrDU9tgbHKVClmS+2svB0yZi3jLI
	 HVmWUhbuuNtQ4xog/QXK06m3HRCFL8/K+q4JNWOHKpdc8lQXpSnJtg/RizR4HABw4xA4+
	 b5lWESi0SYomLpt6wbIUZRYombQAHz3E3gHQiLGRHMaMziFNwRv4qv2NIqsNYY+i2U1V8
	 MkcGO6Y0mEf54hInMF6GiEBaSr0Q8cEeIORiSGZpvdXZj7UwjiNh9w7jeXgwXM0li5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
	b=SiN+Cgxr5GZFSbVQBS0N1AgInVEwABEE2i324pOTs6xxM5y466W/sjHIifO3MWWZZ2hp
	 jFUjlbqBHslihUeHgap17LWJHN7WD11C8htqy+zkwQQO9B0YXe4LhJeSc4DDyzCzNoeEn
	 chmPoOspyO0jgLq/0xOO5HsXvz4k0PWVgKDKTLGNFNMXJiXyD+hGlVUXzE9SSbJ9rM0Rc
	 0a2pd+N3nSMSeVXLzqHZmRW2gwjLSJ5FWNmNxegiwLQoYwmTgWU4JsFHrX2Pr8uTZLxbn
	 OSYunJcVC74LWml9uabOHVWgFGP1N5J/PAAweEw48iXC74xw5NHHBDaxiYK6iVsIhwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=FxTfTaD+;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BB606A329
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 22:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40BB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=FxTfTaD+
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1467861f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 14:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794780187; x=1795384987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
        b=FxTfTaD+v4GNblSlBEZwGf6lcI9KlvsYDoexCMuU7Z5FcfFyb+OxfhKfRWs5Vs6bvW
         yjy17iDAak6jm2ZakavdwYsKT7/qTJhR0hPMZJFFII/exXCptMTdJVBAuX4FcUDOq1z4
         Y60ef8DNp34FJJRUg6qRII5+IN5kSk9ZHtyeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780187; x=1795384987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
        b=WEjGDpaD20mPBZ6GNlEPEc+Qh6fDW0rFAY4NdxD32Ts3RxO3j+kcJ2xe1ZlB2PAjP8
         DbZCixiwr94/ur9LUkT7u8F7ulpj93XCz32z0tAItCWFEBMl0NLGnsuwBrLIYXFy3iZg
         1rXKw3n81BF/bsHBz/U8zVbsU6obZ5zu1WzjXm7euAPzMAsM6fBZr7vAkx4XOAikPzWY
         po1LB7RMj4M4Gnhn5rYOROf+rcy9h2Ybl2ofSxbHkSmEjwRquzmt24t/0e2MG3Ju4Mn8
         Spmpm36+JDIaEZckv1OhlbGLPRy7HrKn1NYBut4NFcaB/Zs+N+M2jWg/MxJozCwCFd/M
         V1Rg==
X-Forwarded-Encrypted: i=1; AL+hErGHQeHEsCe/aMF7DW7rPY+jNvXrqGbjzCor2Yq0pvP6RmDE3JlblmfZ8HOJImAiv7kZGYADWmS655c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g5MSB3JFLgtlNf9eGs6e8BE/orcJ3cqUJAEW8r/2B1ROANGGO
	5Xosm/qizB6HBBND40mCZZ3z8hKKa074ZdAYMH5hKzG8tBiI9wvyp3l+IBd3l8Knioh0OOt68U0
	ZXJOJZyvacg==
X-Gm-Gg: AYBFou3LgYFDyVFiIeRq6OcDRQXVcOT4QAbi66wzxQ4dTaIUwZlaztDhIgGbTiLieF+
	0sRdbuAJ9+dUTPsDSNL78QQNmkNjT0NXDv89Udwx8S4xXdhgtbD+CFSEhIJzVs0ilsgYl0uNa81
	kcykJ+3A7G8PHJpeIF/wEvhAj8tZ4XNlSmJ+jTmU9tkwNt738Z9UQrT3PLu6WnluI56rmyYUBf9
	hH62B4Mrgmo3eGeGdB5lR2rGoQpNh6vvI2QGXuIjynJeD1zQF8X7zYeGxWO/BAxyvdPr+7hgPbe
	8pISxnhBOmCqU97ZSDEsiR+e56OBHjfJA/hhsmUH/TmeYrHG0emb0QHY+JlA4hIhXfwLxjI9Z2P
	RPDCyOT7arzS6puWeW9iFIdNWHLMhxb34io/1Eq0KTEOAcphRndOu79F3kAUssUhGscbqBjgwOw
	0IzjFd0x7DLhObskelnGMVBt6mvvpn2EpTi4LRvx5pIn30x1DYqfImL+Rq13v+AYtVAumKS7iW1
	jZJpIG0ZezWSHsePkjTVkJz5NJiJqp5mGUPj8zRNqAyfbNKmmXjeaiXE0PYGXsXxy8c2SoAOF/F
	P/Rzua0G9QKGAa2WJhK8TVhN7BYOaJCS526/wJ9SOCvykq1iRjWyKzmfSoYd3N0rL22w86wn14K
	6SCtgNYLSaymKXqqxmw4j90+5ICq9NRgF99q/jrPUDnI3yq3MzNtukqAUSBEbDYjf9XhGMlic5Y
	CS5QSp3P6IuO2ebQ==
X-Received: by 2002:a5d:5e01:0:b0:493:c0a:507d with SMTP id ffacd0b85a97d-49c6e4a3953mr20083609f8f.1.1794780186868;
        Sun, 15 Nov 2026 14:03:06 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm16616543f8f.27.2026.11.15.14.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:03:05 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Mon, 16 Nov 2026 00:02:58 +0200
Message-ID: <20261115220258.1519467-1-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-2-vadim@yuzi.co>
References: <20261115185335.782678-2-vadim@yuzi.co>
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

Please do not apply this patch. It is wrong, and I found that only now,
testing the changes for the Sashiko review. Patches 2 and 3 are not
affected; numbers for them are at the end.

The test: SG2002 (DWC_otg 4.20a), a tone played into the UAC1 gadget,
eight 200 byte requests queued, and interrupts held off for 12 ms once
to cause a BNA. With this patch the endpoint is restarted, as the
changelog says. But from then on it takes one BNA and one restart for
every packet, about 2000 interrupts a second, until the host closes the
stream. Most of the audio still arrives, so the test I did before, which
only looked at whether the stream went on, passed.

A trace of the endpoint interrupt and of the restart shows why (time in
microseconds from the start of the hold; desc0 and desc1 are the status
words of the first two descriptors as the CPU reads them):

  12015 irq      DOEPINT 0211  DOEPCTL 000480c8
  12121 restart  DOEPCTL 800480c8  DOEPINT 2201
                 desc0 8e2d8008  desc1 020000c8
  12129 irq      DOEPINT 0201  DOEPCTL 800480c8
  12630 irq      DOEPINT 0200  DOEPCTL 000480c8  DOEPDMA at desc1
                 desc0 8e2d8008  desc1 020000c8
  12715 restart  DOEPCTL 800480c8  DOEPINT 2201
                 desc0 8e2f8008  desc1 020000c8
  12725 irq      DOEPINT 0201  DOEPCTL 800480c8
  13633 irq      DOEPINT 0200  DOEPCTL 000480c8  DOEPDMA at desc1
  ... and so on, once a millisecond

Right after the restart descriptor 0 is already DMA done, with 192
bytes received, the frame number of the current frame and the L bit
set, while descriptor 1 is host ready and never used. A second trace
point shows descriptor 0 done even before DOEPDMA and EPENA are
written.

So, as far as I can tell from outside:

- After the BNA the core keeps the OUT packet that met it. DOEPCTL
  shows EPENA clear, but the core goes on trying the descriptor at the
  start of the chain and raises BNA each time. That is the repeating
  BNA of the changelog. Flushing the RxFIFO, which
  dwc2_gadget_handle_isoc_bna() does, does not remove the packet.
- The moment descriptor 0 is host ready, the core writes the packet to
  it, without the endpoint being enabled.
  dwc2_gadget_start_isoc_ddma() fills the chain front to back, so at
  that moment descriptor 0 still has L set.
- After that the core is done. DOEPDMA and EPENA are written, the next
  packet finds descriptor 0 used, and there is the next BNA.

What I tried:

- RxFIFO flush just before the restart, clearing DOEPINT.BNA just
  before the enable, reading every descriptor back: no change.
- Global OUT NAK around the restart: GOUTNAKEFF does not come within
  100 us, no change.
- Marking descriptor 0 host ready last, after DOEPDMA is written: the
  chain then runs normally if the core takes descriptor 0 after EPENA
  is set. If it takes it before, the chain again ends after that one
  packet.
- The same, plus: if the core takes descriptor 0 before the enable,
  wait for the packet to land, give the request back, build the chain
  again and enable. No packet is waiting for that second chain. This
  gave one BNA and one restart per hold for 34 holds of 9 to 50 ms.
  Then three runs failed after 10, 19 and 9 restarts, each time on a
  9 ms hold, which is the edge of the eight queued requests: the stream
  stopped, and twice the host reset the port. I have not traced that
  case yet.

Thinh, what does the core expect the driver to do with an isochronous
OUT endpoint after a BNA in descriptor DMA mode? In particular, is
there a way to make it drop the packet it holds, or a defined point at
which the chain may be written again? I would rather do what the core
is designed for than poll a descriptor in the interrupt handler.

The Sashiko findings on this patch (BNA handled after the chain was
restarted in the same interrupt, a BNA latched before the restart) are
real as well and are fixed in what I have, but they do not matter until
the above is solved.

Patches 2 and 3, same board, TEST UNIT READY as fast as the host can
with a 1080p60 H.264 encode running, counters added for the test:

- With the read-back of patch 3 switched off to get BNAs: 368000
  commands in 120 s (3070 a second), 13103 BNAs, 12809 of them
  restarted by patch 2, no port reset. The other 294 were on the bulk
  OUT endpoint, came together with XferCompl and found no request
  current. Two more such runs: one the same, one with a port reset
  whose cause I did not capture.
- With the read-back on: 546000 commands in 180 s, no BNA, no reset.
- In about 40000 BNAs on bulk endpoints the endpoint was disabled when
  the BNA was handled, and no endpoint-disabled interrupt followed. So
  the timing cases Sashiko describes for patch 2 did not occur on this
  core. I do not know what the core guarantees there.
- Patch 2 in that test restarted the request from req.actual, as
  Sashiko suggested, not from its beginning as posted. A BNA on a later
  part of a long request did not occur, so that path is still not
  exercised.

I will send a v2 with the review fixes for patches 2 and 3, and with
patch 1 either done properly or left out.

Vadim
