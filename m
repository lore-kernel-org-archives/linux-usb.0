Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7538D37E2E9;
	Mon, 27 Jul 2026 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136271; cv=none; b=YQ/z2UpSyOZmkMjHaJXiOtjiU80hs6tkrCjYZx3NuP8sJuve6OiiD9/u6/hKfjwa/1RYPCzamo34NZMeeQTkDk+TP5F4GeA3azTRKn52um16ODsX/3tOh5nPdnep+0kD0d0/qMm4DYJ1DKdCZ8F3yErhjFKxyYmYy0wNjb+ItJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136271; c=relaxed/simple;
	bh=IoAulvL2ymot7MCIcP9KQvs60IpuTe+QIH09+vO/zqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUm0wVHdPCZLWqYG+utO0W8Ncg2/igWKfcbNRAZVhxm6+gYiDFKBceLCps7RzoA0TQAbjNayqYzJU/YeWmnTL7DSHTJjIOlNvb2hzNMNAwB5MBjKFAljb6/gDnXQiWIBiOWQW55jvxGG3LOy5N6oi5Z48XGDvi/ZB8/AoZAo/OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAkAakP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAkAakP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBA11F00A3A;
	Mon, 27 Jul 2026 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785136270;
	bh=IoAulvL2ymot7MCIcP9KQvs60IpuTe+QIH09+vO/zqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QAkAakP9C5+NU1EqDCV8N/ffmU/76Pk58xm4a3aCsUTdNBbZPrNZ5H9gof3kgoddF
	 KDXaecE1wL7N49c3vfaiFo78eVJ4ZhyiM+3h9V5ZipR1JizEwK5rfP/edwgy4h5Oqj
	 g2fo+v/ZymtRod34kJZb2eITiwmSSH03RXuAej7gHekjBjaNSbKPCWho1sIvP6lGfy
	 6QobSiPobsrftocLzwAj0kKh112QmdKUeObswbRDxBwYYwwoxVw7dQpF7T2j6sV06z
	 LDVsWKBIPqVQ8YXeq9FEf/LmnaTtetjp8EaUhmhrBLFHLTJvrYhF1ijRgJPFH+MWcK
	 HlQ/NyXzITmEw==
Date: Mon, 27 Jul 2026 09:11:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Message-ID: <20260727-convivial-capuchin-of-upgrade-a0ddfb@quoll>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>

On Thu, Jul 23, 2026 at 04:09:04PM +0530, Krishna Kurapati wrote:
> Add definition for EUSB2 phy type.

And what is EUSB2 and how does it differ from USB2 which is already
there? I see that USB org defined a standard for such phy, but a very
quick googling suggests difference is only in the voltage, so not a
different type. At the end, this is still a USB2 phy, no?

There might be more differences and that's why you have entire commit
msg instead of repeating the subject and diff.

Basically in all three places - subject, commit msg and diff - you say
the same obvious thing.

Best regards,
Krzysztof

