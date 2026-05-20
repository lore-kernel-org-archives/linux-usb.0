Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com [101.71.155.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984EB3438A4;
	Wed, 20 May 2026 01:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779240561; cv=none; b=b0AH0WE1dsmvxqlFIHP0Hp4DNwOqHTfNMez2wEcZvCw5Dmp51bsjCJhjwdAu3jGpKZGXQO5myFL7FfcdhuF7EkPb2igq/MJqqjG4sPOQYpCIgBaYeRl2pMRe4rQGyOmH3YAtbIZ+z657++T6bYDsrOLzqNpozyFgOjryrV5Akus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779240561; c=relaxed/simple;
	bh=eNY+r0g315K8v20Wzfkmq5r9clhD3MRkrGleKkpczMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0KKCfp1n+59klH0mHWQ6AICxsTFt7cU2/Mqb6JniS++feI4imMWFyurmP4EqwJJHfN2lBdh+eqpt3ji/YaRxAAiVvKLCoHPO9U7cLwMUcqjlRirKjgiSPn28SRsa8F+1m65p5re+UA2UVtNJ9smvRUZZWV2HoJRL1R74t1pEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gwTF78PP; arc=none smtp.client-ip=101.71.155.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gwTF78PP"
Received: from [172.16.12.51] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f0f4bf32;
	Wed, 20 May 2026 09:13:41 +0800 (GMT+08:00)
Message-ID: <c0bc4796-afe5-40ff-8816-9605a6114d23@rock-chips.com>
Date: Wed, 20 May 2026 09:13:25 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/9] Add Type-C DP support for RK3399 EVB IND board
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20260304094152.92-1-kernel@airkyi.com> <agxo8ic94e81nQRx@kuha>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <agxo8ic94e81nQRx@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e42f214cf03abkunmde1056153a93c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQkoaVhhOGE9LGE9LQ01JTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gwTF78PPuLUm1sysWyZUVBaAIEKd3WixyNY3bmjSc5enP6t3T7LjW1vDPot1Ro5hpeJzDUUuaKmRf3Cz6DX9uu/L1JxbBv2q7RmlverbAPspYQqTopSj5X3/+EdlkoFK2PHIs+UdzLX137UjUapaHB2spXQq0d9N+RLByQu9LFk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Puww1BH0j/oGm+Paq7ifcsE10dx5Hg0yZyciu4GUl4o=;
	h=date:mime-version:subject:message-id:from;

Hello Heikki,

On 5/19/2026 9:43 PM, Heikki Krogerus wrote:
> Hi,
> 
> On Wed, Mar 04, 2026 at 05:41:43PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This series focuses on adding Type-C DP support for USBDP PHY and DP
>> driver. The USBDP PHY and DP will perceive the changes in cable status
>> based on the USB PD and Type-C state machines provided by TCPM. Before
>> this, the USBDP PHY and DP controller of RK3399 sensed cable state
>> changes through extcon, and devices such as the RK3399 Gru-Chromebook
>> rely on them. This series should not break them.
> 
> What's the status with this series?
> Are these inteded to go via the DRM tree?
> 
> thanks,
> 

Thank you very much for your continued attention to this series.
The maintainers seem quite busy... Despite there being no further review
comments, this series have yet to be merged into the DRM tree. 

And some of my other patches are in the same situation. 
Do you happen to know what the next steps should be? Thank you.

-- 
Best, 
Chaoyi
