Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7DB2264C0;
	Wed, 19 Aug 2026 04:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787115228; cv=none; b=rct00dT/fTrHHMvz87u7+07ZJCqm86DkmXeVkgxNt9GLP4TMB5yAV7OJO1WM1u2u+f8gXy7NJp94LNykV0bczhf8A+DOjAKDaoVRqLzFdkcvHx134W1L6iQbV9KpWnKCRnu7L9w1RZ7gNv9OQWkoRVojOUb9jDG5J8tqV/OWWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787115228; c=relaxed/simple;
	bh=Gp/KM9mqwbvYL+C35FrB8QMNXqhSFZ3oBFBDcYPTZ2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+l5QMtRzqUF3tMK7JP2B0x9QWpHme40OISIgB6CcY/SVe2+a4oM2Z0S9ayoxoYEREjSDZ1m2seXeWmwpRwtPxUB27Qk37ncxAB1PdhK7CrsFl76Y/yaUlBIhNjTvkBjB4oI9bOei5fVkjvFUreaSGm/TtY4UdMBTFNfpmtmvTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=jXLHRfRA; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="jXLHRfRA"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85362107AE6;
	Wed, 19 Aug 2026 06:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787115213;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=c4xs5RT8u9h6JXPgD+W9cpvSw000rGM/Suoj6WVsp9I=;
	b=jXLHRfRARDuSTChCOAmU2yG9xCI2B9rFHhA9zXkIa7RGh/vK1f3YZm/uvAIW2fhIV3VT81
	OlJFZAGXEMkDVVzzXwUlo1GQ8iVEgtohyciKVEwpiBsUxYqORK1RxLfLjOmU9d3Nd/PB4h
	XJsx97Hb+wBrLqZ6w2BSrRnUgBeUYZ4qX215ZM9bght/2DdOQF+pix4uwzX4K7VgM0+0Kv
	qNE4NGC+4VP4wYT/0I3pvxo7qGwWfNXRLhpFOXCv4yEyc1Va4IVJ8QkNhGJ7SFQ9NdJODV
	DivLj/nAEVL2NnYJ2i9RWy+dPFW/bo0ITym7lBZntOxW86lEZXkDc9nEFYlxaA==
Message-ID: <272be90b-7127-457f-90e9-7160169e2200@nabladev.com>
Date: Tue, 18 Aug 2026 17:11:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-2-marex@nabladev.com>
 <20260818-imperious-thankful-perch-dcaa44@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260818-imperious-thankful-perch-dcaa44@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/18/26 10:09 AM, Krzysztof Kozlowski wrote:
> On Sun, Aug 16, 2026 at 11:37:03PM +0200, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
>>
>> Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
I think I managed to fix that up in V3, thanks.
