Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B52F8EB3;
	Mon,  3 Aug 2026 06:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739768; cv=none; b=Ast7q+BzYYDItGcE4ZqUutS3/wsum7tnzRs2IzJlvrl48Rw6Tuy5u9/R19lzodmzfBV2T2yrD/6pucaLFgbYMywNc5T/6fVO6mXxggJjkS/HXdOb+Llk0xsIeWrhSBBkH9aOZOBmaz7Gv3bmSedQyDaxYSfk7GX3CNBlgaVgcdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739768; c=relaxed/simple;
	bh=n7W1/CR2fnqvRQ1Me7jxh9E9/huwjhD6a8dCIrKmWQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgJE4sliAE+qABxYfgHQRX84VBANlXabizEgQPcU0x89HOqF19GhalVjkyBqLKts2b3giO8yenTFNcFWOR/ecEApNXSAecd26roG5ey6S1Fio7IecZcnbqc+byihilmErwRK3n4tc1M9ZKgfcT/nMrXi4ohMMorm2qHV2tU2E80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHPwSwhr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHPwSwhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1E31F000E9;
	Mon,  3 Aug 2026 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739767;
	bh=JPTDrdjixJ8M01ykdTWBJ/WbejRC3iM9Zy6wkUYIJw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oHPwSwhrC3By/P1n7JX4mUc/ARiE+Ebh6/sf/5IUjy3dO5WrjIa8unyo7BQvJTGrD
	 Oxl3igQYFz/u03OTFpqyy4F0w+T58YP9lLCoqdXKnTGfvT4i9Gm18GZv9UdK9Q/UvM
	 CV1xX4bmGo5a91yTAPCb1LldEOx/48qZcuzhOSRrYgw6QC/Bg9IFgHMCm02HUzwq5J
	 hTp1zRC44BhbajlRWgaCfn4bHOyoZyGNLexU+4mJXiwZQM29+hDKe9qDttoR3KsM9z
	 5jPOanplVvQ8nbscml7QVcgGf24V2mn7u2ek+ptWcRptwEVwjgU9cC2zBDfnypGapW
	 FhjWJ9btpWEaQ==
Date: Mon, 3 Aug 2026 08:49:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Message-ID: <20260803-real-shrewd-bee-ad6cba@quoll>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
 <20260730-rzg2-sr-boards-v4-2-08bc459578dc@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-rzg2-sr-boards-v4-2-08bc459578dc@solid-run.com>

On Thu, Jul 30, 2026 at 01:38:33PM +0300, Josua Mayer wrote:
> Cypress HX3 Hubs are combined USB-2.0 and USB-3.0 devices, and should be
> described by one node per speed and linked by peer-hub property.
> 
> It is however possible to install this Hub to a USB-2.0-only host, in
> which case the USB-3.0 peer has no place in device-tree.
> 
> Remove peer-hub from required properties.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

