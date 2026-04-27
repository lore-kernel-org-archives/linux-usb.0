Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED65A282F18;
	Mon, 27 Apr 2026 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289181; cv=none; b=Q4WUeWz9eE8UbfG+7Ww4pigbzNHXB/QSXey4b5s3loRYc3Uiy1+kYbORnyjoQSgaDtCw85YnOBWHl8IGscNcyFUB6g+JVVwgdwW4MnKKtT+NOLB0Ts7PJQ6119wRKjx/f3dDnK6SKXFVjDXQ8HHX0+RwI/YKxHiYpj+9Elhjzps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289181; c=relaxed/simple;
	bh=bynSCOF9fsKtICt6R11L2231yszicJ7C9pX9S86/5jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sK1Q3656PCKfJVxHwJ6myAuTid6tob8eoBBw2gr/hqRE0iCF71sQbKpHrbp2c7xEoMPA6iwkMkLFE1wwS72HRCtDwfM8kBD0i5cnNdi07hy38x4flIToJELgfObd5M5/2t8dI3ta4jtFjLmZbBz5lKzB/M7eKY44+cTtoWVZtx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yHhasqvU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yHhasqvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C64FC19425;
	Mon, 27 Apr 2026 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777289180;
	bh=bynSCOF9fsKtICt6R11L2231yszicJ7C9pX9S86/5jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yHhasqvUuNWHnDbYMQW+tUfmFYkWZxAkz2K4nR+I0RwLFX1RPULBzKjhztg29MPjo
	 A3bvNH2EPwsjdLTnjirVg6SwLh2CkMgVE5QCJzKMW1xeUvsen65dchK6cAjTJqX8S+
	 3kztDEajcF29T2xaMl9HcouzGvdMoxoRnPiKHC/I=
Date: Mon, 27 Apr 2026 05:25:45 -0600
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	=Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] USB: qcom: Unify user-visible "Qualcomm" name
Message-ID: <2026042711-populate-manifesto-e206@gregkh>
References: <20260427070044.17974-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427070044.17974-2-krzysztof.kozlowski@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 09:00:45AM +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> And "Qualcomm Technologies" has even variations over the tree:
> Qualcomm Technologies
> Qualcomm Technologies Inc.
> Qualcomm Technologies, Inc.
> 
> I am doing this tree wide:
> https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm

Does that mean you want to take this through your tree, or you are ok
with this going through the subsystem-specific tree (i.e. USB for this
one.)

Either is fine with me, whatever is easiest for you.

thanks,
greg k-h
