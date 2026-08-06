Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67A485503;
	Thu,  6 Aug 2026 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033589; cv=none; b=Xu/lwAwJhsdGA1+sHtLfp2HWeubLsmuX0l34PxQUb+QVYsQp9vvbKq7LCl23yZDsjwEIutIobL8+/1ag23WIQeHGxM9uaf68Oln3I6DAMeIschB0TDf1fahQu4l638QQe2iKtgoPZ55TA8iSG43eTfas5SP+teNEB/5Dz7KD6KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033589; c=relaxed/simple;
	bh=g6RpmcELXAT67asjWuD4/vExTXfOtqigdE/t8eFbwAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YBQCUcr3dJhlabdCo8ApcPHbldEY8nDgbKQdpyd2JNUEqCzvgUC6yh5P9WB8CLF7UHpInYZGJhDvDElfC4S7jKeN50innTnFJM4B3mrTrKCp3SvE8I9kbcEMLXR9SAdCmRej2IVUb23RoavLIpDTwYYbjGgA4bIIZMoajmGsDAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hE5gJtCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hE5gJtCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67A61F000E9;
	Thu,  6 Aug 2026 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033587;
	bh=At9UjLcc9nCG2gn02sYU/L9U1ALtFx3AWFq753mcnNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hE5gJtCu45t3BF3VUaVKUq1jRqHvH9hJBX+bGcDa5e9X/c+6EgFCkulirNeWLCv1/
	 //YQ5zSX8I37I1ZWsDKjFlB2G0O6Z4m69r4CT8j5pkva98uKLglBy2m/emXWD6bXeA
	 OKDgPUWJWJ0j3cjvM64CA5ZtF+X2+UMgyFJk27EZ/31F9fNckZAFufqSWqXSY+gNIa
	 8Us8E7sZDv9yMqVPyoQNsiPKgGtJ7r74bgDRsoYOMt8wMf6TmtUsVT2MmgfnApFdfg
	 wxXkE29dtx8kKkyCBCmKopRtFFHT3czLbmYeCRmIfnQr2E0rPMdzXG3u3ZYDtfqhE5
	 g9/mpKFVjh4zA==
From: Vinod Koul <vkoul@kernel.org>
To: Vincent Shih <vincent.sunplus@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803-sunplus-usb3-v1-1-5a562524c869@gmail.com>
References: <20260803-sunplus-usb3-v1-1-5a562524c869@gmail.com>
Subject: Re: [PATCH] phy: sunplus: fix error handling in sp_uphy_init()
Message-Id: <178603358526.674490.11629336730066140241.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:25 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 03 Aug 2026 23:15:17 +0800, Felix Gu wrote:
> Fix the error paths of sp_uphy_init() to undo exactly what each stage
> did: return directly if clk_prepare_enable() fails, release only the clock
> if reset_control_deassert() fails, and jump to err_reset if
> update_disc_vol() fails so the clock and reset are not leaked.
> 
> 

Applied, thanks!

[1/1] phy: sunplus: fix error handling in sp_uphy_init()
      commit: 8b2683bc4cc18c581b7cd24f227cbe61abca7f4d

Best regards,
-- 
~Vinod


