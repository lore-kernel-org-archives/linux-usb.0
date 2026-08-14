Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498B43F4C2;
	Fri, 14 Aug 2026 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703532; cv=none; b=a7rL6Ka1fSXAKVqY6OIqF2gUb6IS47W37rth57BF5MCuHsOzPZcOhoaVo6ZxU1U7DO5wib+vgSmRsI3zAocxXBn2nk9tGJI2La46kugIOGSWxLEuXIlFIwNp6kx7KJBmHvLNeHdCay69Ob0aRS9AVHjEX6OH6oeVyaSEWTAUjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703532; c=relaxed/simple;
	bh=IOzWA2b0aYhsfF0sHRhAWGJv42gCItzciQRYf6txQKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J53LbgLBh9IyiYmpXkFWhLhUKGPPNKQJICIulmmPgFu+wniI4jA/1MjOMV7FYbhphU/KAZrQQlxnrxT0G95hq7dyVRUtBcGBzK6zSrHP6+wxvXIq2Q5L8M1tiX+7PmTKFeGFLfYkjVwkOuNbOLl3ASbXuPQBO+DjBmnwR5Xu5e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC5IZWh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kC5IZWh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1D81F000E9;
	Fri, 14 Aug 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786703527;
	bh=IOzWA2b0aYhsfF0sHRhAWGJv42gCItzciQRYf6txQKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kC5IZWh+0+2yzgUANAlE4uUxlBQ1ylWV9AbGabmeHEcwpgi63DVz2Sndfs6Kbyi4Y
	 Eot3AoZphew0eBbm7jXop7CJkDv3qYfZbC2FkSQzMS5vl0ugfPt34BJrLjUa04Zabl
	 tgRRnktqh3Y6adf4eH7SsOdpSYCbMEpoUcB2G90/lR2qYDHsui8ICd/ps5hosH5xiU
	 4XOyD3SJZupYpN6x7WWbWXaHjCjlTxHYwfTvDIgG9UfGygHvyGYeuh1O5Kl95VgEe/
	 /29SkdJ8+1hmoCf1ANJIiGDqPFd/BHMHC1RxVjLeSKOzVT0r2QkIdPw3EUx9/oE0t2
	 PJbI6oBKdMfkw==
Date: Fri, 14 Aug 2026 12:32:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH] dt-bindings: usb: xlnx,usb2: Make clocks required
Message-ID: <20260814-true-greedy-woodlouse-4cdb5c@quoll>
References: <20260810154548.2133565-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810154548.2133565-1-radhey.shyam.pandey@amd.com>

On Mon, Aug 10, 2026 at 09:15:48PM +0530, Radhey Shyam Pandey wrote:
> Add s_axi_aclk AXI4 clock support as a required property. Traditionally
> this IP was used on MicroBlaze platforms which had fixed clocks enabled
> all the time. But since it is a PL IP, it can also be used on SoC
> platforms like Zynq UltraScale+ MPSoC which combines processing system
> (PS) and user programmable logic (PL) into the same device. On these
> platforms instead of fixed enabled clocks it is mandatory to explicitly
> enable IP clocks for proper functionality.

I do not see the clocks being added. You made them only required, but
first sentence suggests you add them.

I still do not get why the traditional "MicroBlaze platforms which had
fixed clocks enabled all the time" are now broken and require the clocks.
IOW, what changed for devices which you claim do not need the clocks,
that they now need the clocks?

Maybe this should be required only on platforms which actually need it?

Best regards,
Krzysztof

