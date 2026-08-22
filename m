Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D23A254D;
	Sat, 22 Aug 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385410; cv=none; b=fTp3OPxiYEg2H2b+3xSDhl2SzWDvVaJl5zxHrzuua/LdK5FITFcx/WtUjf8N6tYpGNy1DFA1PlJNWpW6YlbKhf7xlniNk4qzF3zY826N8cSZDNTjfrUHPbTgiz1SAmmrNRwmmm1unqVDxU2AmVnVBtB4Wot+Vqf60ZtoCvPFmfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385410; c=relaxed/simple;
	bh=HBQsZ9sztcocG4wYC6ZYc3cZ7Z9TTnsPQDAnWK6AJls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOOcAnsquvXWAvB21cNJZpvi0cpLq+Cirlgyai47AkRfqRlXm2RNE4LrwqhbRVF5cLAlefq8/Ofse24uPMDnjXX632knzks+zHvfSJzX6oJ4gd4b9Qrn8R6OnAOiJ316tn8CvoqnTa6ZnJasRMqHnCKQkzppN36bjID50Psgs6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=AQneZjyG; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="AQneZjyG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 278CE11C825;
	Sat, 22 Aug 2026 09:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787385397;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b71gCC+k/ow2F9I1vD8obsXEh1cTAgN4mksV3ZSTdiU=;
	b=AQneZjyGLZaZJaVm3tKxA8Hhi55/aO20sgctI7Ix0juSm2LWB2+jZ66/YMu+0VRqm/mEU1
	5m/M1VcCh+OG1Qur2Fy6ybGH5ib1LboZXilQiwUD2lGItjlv2GjpgEQzN5fnnpXPh7M1U3
	jMG1MouwPZhsi6agPhLOVKDjjfcNpjKFdAu7Jrd4wo7Uop7h3GbIKQX6lJYR6fdu2NntQv
	zfUOPtHe4A0VGaFcRaBtCCHdL+NqVpaJB5K6D6U2Dz1BV5DigMs4NvuqLgun75Ezw1LOyr
	kYmyYj+NWnRK4qEZwkK/+RwnN5JjFS4hHJFIQVWaxI3iOsArgrPDyP2EukwmJQ==
Message-ID: <745a30e5-3fc3-406c-9263-1c1c8ca9135c@nabladev.com>
Date: Sat, 22 Aug 2026 07:00:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] arm64: dts: st: Add ucpd node on stm32mp251
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pankaj Dev <pankaj.dev@st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Thomas Bourgoin <thomas.bourgoin@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-8-c5e27cbc0795@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-8-c5e27cbc0795@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/21/26 6:23 PM, Fabrice Gasnier wrote:
> Describe UCPD bindings and nvmem cells to access trim values.
> This provides the PD and CC USB-C cable signaling functions.
> 
> Co-developed-by: Christian Bruel <christian.bruel@foss.st.com>
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> Co-developed-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 51 ++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 9dc7a05fce99..be54dd56713b 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi

[...]

> @@ -1818,10 +1839,40 @@ part-number-otp@24 {
>   				reg = <0x24 0x4>;
>   			};
>   
> +			ucpd_trim_3a_cc1: trim_3a_cc1@1bd,1 {
> +				reg = <0x1bd 0x1>;
> +				bits = <1 4>;
> +			};
> +
> +			ucpd_trim_3a_cc2: trim_3a_cc2@1bf,1 {
> +				reg = <0x1bf 0x1>;
> +				bits = <1 4>;
> +			};

These two fuse fields ^ do not seem to match STM32MP25xx documentation ?

RM0457 Rev 5
Table 876. UCPD software trim data
Page 5013

                Non-volatile memory location
Name                 Address       Bits
3A0_CC1[3:0]       0x5400 01E8     11:8
3A0_CC2[3:0]       0x5400 01E8     11:8
^^^^^^^                   ^^^^     ^^^^

>   			package-otp@1e8 {
>   				reg = <0x1e8 0x1>;
>   				bits = <0 3>;
>   			};
[...]
