Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289491;
	b=s1vqOe5O1gBCWPGtnaYYGvgrUZQ2a7B5n4+S1XAgpBmk6Jtspt8q6BN9OFDGibLAZpDM
	 nTwdXiAQ/9Q1wS1vsd0dhq/zfJ3B5AFUAPwEsoSOgH4BEopp6qsivob8xE/knltN22C13
	 VtgazTf5WAnX32zvA4MNTmzDLkCNwdSJslTJ6Mcy7giSJygQ7HEqYT5C6ZwbJUKg4OpsH
	 Xjj+47DyLs1OI1kS4P8sOIH/yg3uKzMaJ90fBzNHViVhCzzA0Na5FtU+PCHDgXOkSQj6k
	 dvcSCEzqpKmeJo5Extb9j+ENU2yJfwhQFLpW45tXWUAsIaf7OVbUITt6CPWVtcNbfAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289491;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EypR81wghhS1C3S+cwYO0gRmc3XYoh1lyYySai7+bfo=;
	b=tbXEL8oyID/OnREywYJhs8g56H6ZztQraaceJTAEvP6N90VhBJrHcywsGn1RhLhV8uSD
	 dX371xtCMABWBdkkvoQBUolRHfTMDOq2s/1aXwqkAw7z2U+OFETaDb9PvfAIFuIVx9TJ9
	 ZvcB13qZNsqH9DPbDgbqUnMRIrzPIimBT10R89oQWxS2teuPRAUPO0uQ/EGXrCQxCOAgO
	 hfsx6h9P3DoGP9aeHJAFLsTMSyD5xM4y/KlItqjhiMgk7gItpslK55TXvPVydCi6iRNsQ
	 5T1FsBeYtEw20412wIviJRVEURfiDbdD160qXrZSDK4/Wyg5ddf0qgRXaaLQWVAE1/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b="NmSG/BKQ";
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B73606A332
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 19:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B73606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=NmSG/BKQ
DKIM-Signature: a=rsa-sha256; b=NmSG/BKQrgBtQgREF4Ds+Wuewpyl324eVl3S/vleH37p6Tk4rn3F1GWNG+qarizotfbc0js5U11kqyE/EaQyo/aYMsFLeSnF9bQ5SMoFl+al3EbMvcEeioHyn/P65TEiHyaJKAAZpEZv5PxwbPUGirJzcBovxoojE60Dpg46nGF0uuCv5WZfK4QvQKq1jcIpnzyEDJxZGtePa9608Z6pNDx/UovNmaPiaclLwDZp/YMpSGAZGjgkTgEhrnklsWDfxDiP72nZ9cnSxP/RVsvCoOBp1IB2lOGBWepGLa+0qSXda7hF2OHfWlsEYGD3HCX3C5fvNAMJZnuJiJa5MM1CYw==; s=purelymail2; d=purelymail.com; v=1; bh=EypR81wghhS1C3S+cwYO0gRmc3XYoh1lyYySai7+bfo=; h=Feedback-ID:Received:Message-ID:Date:Subject:To:From;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1481673243;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 21 Nov 2026 19:30:36 +0000 (UTC)
Message-ID: <3c7ae669-d0e8-40f1-8c22-3eb198533ddb@mentallysanemainliners.org>
Date: Sat, 21 Nov 2026 19:30:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and FG
 on gta3xllte
To: David Virag <virag.david003@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
 <6937fed688e4bf1d7cb81b004c179cc4912cf6e2.camel@gmail.com>
Content-Language: en-US
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <6937fed688e4bf1d7cb81b004c179cc4912cf6e2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21/11/2026 19:06, David Virag wrote:
> On Thu, 2026-11-19 at 19:49 +0000, Umer Uddin via B4 Relay wrote:
>> Hi guys, this patch series adds support for USB on Exynos7885. This
>> series
>> is based on David Virag's work[1] I had rebased it onto krzk's for-
>> next
>> tree and tested it on gta3xllte. This series also enables S2MU005 FG
>> on gta3xllte, which is also tested.
> Hi, thanks for reviving my old patches
>
> I actually have sent the patches before [1], got some reviews, but only
> ended up with the clock patches submitted and applied, and never
> actually got to submitting these patches with fixes based on the
> reviews (which have been sitting on my PC for quite a while).
>
> I think I will submit my fixed up patches (the ones you submitted still
> have some problems), and then your gta3xxlte patches can sit on top.
>
> [1]
> https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/

Ah sorry, I did accidentally miss that, will be waiting for you to submit

the fixed patches then, and I will rebase my gta3xllte changes onto your

patch when submitted.

>> Please note, I did drop enabling USB on jackpotlte, this is because I
>> don't have the device myself to test the changes personally and I
>> didn't
>> want to risk a regression on jackpotlte.
> I can confirm it does still work properly on jackpotlte.
>
> Best regards,
> David

Good to know, thanks for confirming.


Best regards,

Umer

