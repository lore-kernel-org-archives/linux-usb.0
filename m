Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC513777E
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556300; cv=none; b=UjgoByzfoEUeKTU73i1Jw96xSQY8gs/T0x9rsM5tkCEULLTyebD/rn8NE1hoFAmtw63PRbgX8UL0emZERBkwv541b3zEBwwTg/qRzjqqqgG3QadL+y1cO812qWUIz3JYOtb6v9gVXzvofuUyCGx91gjcIsg1/+VNtfbRka0A3U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556300; c=relaxed/simple;
	bh=Qtw4xKKAiDQlaGMtax6UnBAU+d0Qi0wjGCAxPFyFm0g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=W/gW5uwPtR+hOoXWTLM44V/U+S5Wn+bmdR+gx1ffdY1cxR0gSZmWeZevN5OvnfowbxKDwCv4qJHRMC9pGVM1vmMdgK7PjesuB276IX2bmmW2tBwcLEoel0u1UuQxap8SeADsrZobYjf2yeD2Bvgep+5Ezwvpbl3nJX1juXspCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U/TQSPv7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U/TQSPv7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so3763973a12.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787556296; x=1788161096; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=U/TQSPv7Avokss6sadFRw5zmwNlWqihHBEw52IDszBwV8ympi3gSgu1T2DnskyhCfE
         XYnE9Zjev8CzGrENLZNU/e+uG9SUBMp6aoM2K9TfcOvFDrKclsgov3oQ8VpEBJLP9y1W
         ZfidFQUHMJ/YgThzjmoIWxaiBXsB1sArhroG+ciZRl0ugS1ox9oq+U0beTlhKNfzpWL7
         WNHl5mA8odpI8pW465MkX4MD8EYjQPmw2GcFW7MXAP+RZkymk3rdGgM3FDFy63+bE4S/
         C8TGglAbGbtF1GnBZDTlCzENHi4sDdn/VxKQmGVPdRZv9yq5s0Sny+/T1Gz+z1Qq8ZNT
         ac0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556296; x=1788161096;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=NyVbaLCPYJPg4jvb66donZ9T89aqr3UdK2eXqEEioOis5oIcBI4hK+ifw22qhdHb08
         aOXxhCxbKKUimVOmtCVELBHLBQsdcgYI5bOT8u/tZr6PXRYvOwlX1rvWrs2sKCmZnXle
         xUmnac4taWc16KGKCxJysW0MvAQTCe1sHJtcRt/zGUAAU0NE4+3IeM79I5E8VCB2+50L
         o7/v1Nc0GsYLN79pZv4AtZ1X96cy+s5/rcQn1+3Do2hzkYwEOWV9+ZlxWPwdyl5horHB
         dNPvuw0QBdhNBA8vFdhbCRH64/ftu9psYyof98Nixsj9+HozBWlRKC4e6g0dINWe65i0
         55bQ==
X-Forwarded-Encrypted: i=1; AHgh+RouWcldBMmue17enesefX7L9N+0YIg4meQ8tfb1+TQB4XkUPXwvwPFBbwm2IMHjf6S50Gob90uOcoc=@vger.kernel.org
X-Gm-Message-State: AFuF++kBEDEe7enFRafRVVBcjF1j+9mznYHIBRqW2hJ0zPJCHWqXk4cK
	ZtUjJpZQwGLxDaVtw/UZ1puwz0B/7guMTM3c8xPLnXEagrH30i9Im9LdUgDbyDJfUw1zhdT9jOh
	R0/ZN
X-Gm-Gg: AR+sD10IqhduboeiiDPESJZWmCNXFrAUnWEjE81N54NtTHIJYuI3WwmGktHhM8Qi36E
	ZQK2NNm6xDYmw5WtE9XO3MBQASPeIPQk3ZBcahlmRyBeVDiCGp7V9qQIswzyY55xRJC/rX4/6hO
	lBmLU6X7CkcMw5wvnvKKMOvibXJ/ie/OUZ3N4dtKZG2Wdc+hKQFL/ELUW39Bqy7t8T++TmhZgnl
	/FRr05TalMydSODTCk/Qr6MDXgepFWGJMLxJtRw3o5zvzE51KC8iW2vp0N4VKoZXxWBgPVtnvvC
	MHhYZ9BL28hstEl3lMqEzW2cqVe0i3to5n7GpzoSTUMVc26m0gKRBzSNeOXNN9GIXNq+HHeLRkl
	xogOnVJKh38iOREk2pxl7R3AZqmSWyBf5ZRdvIo2R3/fjlBmcfHCcvaKwP9hse+UNbJbQzwGbHk
	Dts2E0B98/OKzLMxvpdsDH+d2SH1Xx69BmosH8tMGIp8XLx54DlgZZ/TfK4Rr7t4xtKQecfbw67
	WXgRoWng4NJX6Ekwu7QU6Qr4dcD7ksl+nADsZ+2kMmJIFjDJVA=
X-Received: by 2002:a17:907:1c26:b0:c1f:29ce:76a1 with SMTP id a640c23a62f3a-c249272d9d8mr2094529166b.19.1787556296453;
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Received: from localhost (host-212-171-227-71.retail.telecomitalia.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f64e0sm1399310066b.32.2026.08.24.00.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:24:55 +0200
Message-Id: <DKWZTL9MS4PC.UYFAW9NOZG5N@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 <devicetree@vger.kernel.org>, "Julien Stephan" <jstephan@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
 "Chunfeng Yun" <chunfeng.yun@mediatek.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Carlo Caione"
 <ccaione@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com> <178576344579.3104650.10771178654777991535.robh@kernel.org>
In-Reply-To: <178576344579.3104650.10771178654777991535.robh@kernel.org>

On Mon Aug 3, 2026 at 3:24 PM CEST, Rob Herring (Arm) wrote:
>
> On Tue, 21 Jul 2026 10:00:28 +0200, Carlo Caione wrote:
>> The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
>> register layout and is handled by the generic mediatek,mtu3 driver. Add
>> the SoC-specific compatible so the controller can be described without a
>> legacy split node.
>>=20
>> For now the only user of this is on the U-Boot side but we want to keep
>> bindings in sync.
>>=20
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks, who should pick up this change?

Cheers,

--
Carlo Caione

