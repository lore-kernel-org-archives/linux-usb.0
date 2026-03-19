Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B583A256A;
	Thu, 19 Mar 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910483; cv=none; b=p1A+7mvaTbzWeWXcl75hRpeeXQ7p3TJEuEztwGVTO+goCA9ydMavz6yXSx9Vpu9c+TqWHy+AJTr79QO4o8hVsyuiVCwduinihJIeMgdXeNpPGyUpQ6mPKyK6WdgJFxGBBJXtuZhOod/Ziml6QmVRFDrInneFkNwqgi0D4F5SxbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910483; c=relaxed/simple;
	bh=XTkHwGEfCpXAF03EyV/Ud0ljL2MbfYxd4BkX/IHGkko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zr51u5QSaUjWaT0SjcMn7jer9+NuxGpKMBEbU0bCEpCb2za/yDI0L3zVpIWsIWDmi4ioTmdox+hgDLwiT3voKHXCWl+AQqNJ1oNOiR75NQWbPJaod1pAqi+GHRAj/svnNU4dOn5fm92iAivNQ2lL6ZNyaogOXNJ45LKThee4SsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIYqBcWe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIYqBcWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DF0C2BC87;
	Thu, 19 Mar 2026 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773910482;
	bh=XTkHwGEfCpXAF03EyV/Ud0ljL2MbfYxd4BkX/IHGkko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIYqBcWeA4aVv/pgrykjtfdnrr+1WA4th2In56cNZsINdRctFBESj/q5mlIOra9Fs
	 JfzZu5WgnIDyy+L0y44G0Kx/p6PB73+Bt19PueW3/HCAd4xPQbOI2WeriJIM9kW+RB
	 YNV4G7xPSbNnMqM+DBglAtcZHQbc9lc1y7ODxOmTQR7kt+A78z5DVCLF2bEFDN2yqy
	 5Q2GVx7vOdwUtuRavIChDYQVa9+MnM5WYurSVzu6vAibwMZ5jqitdG4sgKg5PMFBTY
	 UYxn3pZsCVNitL2Bxr59UPMeLY1Q45BGYAxYQg1BgLX4iluDS1ApC/KnrQa8juL86O
	 Mmw3iH/bEVVGA==
Date: Thu, 19 Mar 2026 09:54:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: usb: richtek,rt1711h: Add Hynetek
 HUSB311
Message-ID: <20260319-fearless-flawless-bustard-c8e8aa@quoll>
References: <20260318-husb311-v4-0-69e029255430@flipper.net>
 <20260318-husb311-v4-3-69e029255430@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-husb311-v4-3-69e029255430@flipper.net>

On Wed, Mar 18, 2026 at 06:32:55PM +0400, Alexey Charkov wrote:
> HUSB311 is a pin-compatible and register-compatible drop-in replacement
> for RT1711H, so add its compatible string to the existing binding.
> 
> Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-bacd-0440d2c21088.pdf
> Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.pdf
> Link: https://www.richtek.com/assets/product_file/RT1711H/DS1711H-04.pdf
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

