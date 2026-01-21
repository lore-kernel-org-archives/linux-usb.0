Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D92F18DB37;
	Wed, 21 Jan 2026 02:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962514; cv=none; b=dFBz4qrpaiODr9GP9VnU6YyHB4oG2t8gGkRlAzxnyO3zb6wnR0NeFP/6Tr6+REnKDQSBAUoZxbTqwE6hX/3X1o/zWQNJBd9HXi875fMYUEt6NSg2Wc3zI4ETgTi1ocPiS4fAkqBuAxM5BNnUNAA/dK00IAMkgJOPo+QhvELs+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962514; c=relaxed/simple;
	bh=vTfHbIosBhIGcDNmkGqJUvupsZF9T0Fme6/vw/4XXAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hemivUq43U3HcoayxAPw9thDoauSMA8Zsx232enziqUXJZ4YjRZiTFAdfQh50vt81MDtz04CxQ1De4rJR5fuMpQ7+CU/zmat47wlZKIITnIj9d4tLREInJTNv7bqpn4zUjX3w5ez6JoVrdFmajdctWQTGks40+n9hUWJoR28E+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYYrENlP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYYrENlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375E9C16AAE;
	Wed, 21 Jan 2026 02:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962513;
	bh=vTfHbIosBhIGcDNmkGqJUvupsZF9T0Fme6/vw/4XXAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYYrENlPoZw3+rWmuqEqKg3k92ScVBL9NUArHLatSJfJ2Rts34vSjz6BJLk8mKNhr
	 UjtlfZJru2wmiUqOX+GMicfkptrMAqcZrgKzFNCdV32cru9yiQ6gyBkDSjd6iyw9bY
	 ScyFDeFT1Zmffj0eW03A/HH/uSXbjRqkAeJLwI3WX/UUNqji6ZH8G3l6ycpX9Ht/+f
	 BjU9JHen9x06nMGkp2NajcdCKjZFBv+qEer+wjmh2RDH1MiC7JNR8CQ7WRm3TNULWR
	 lTro1tYK2GBKdJaAtoicxrWLqB1ycBJlI8zLIDpTHJBMU7/XoLwg21k3R34Wo6B5xx
	 u+NgWJ+ckIUcw==
Date: Tue, 20 Jan 2026 20:28:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, alex@ghiti.fr, gregkh@linuxfoundation.org,
	vkoul@kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, krzk+dt@kernel.org,
	linux-usb@vger.kernel.org, aou@eecs.berkeley.edu,
	neil.armstrong@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: phy: Add Canaan K230 USB PHY
Message-ID: <176896251125.1833421.13897211513814377916.robh@kernel.org>
References: <20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260120143243.71937-2-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120143243.71937-2-jiayu.riscv@isrc.iscas.ac.cn>


On Tue, 20 Jan 2026 22:32:40 +0800, Jiayu Du wrote:
> K230 SoC USB PHY requires configuring registers for control and
> configuration. Add USB phy bindings for K230 SoC.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../bindings/phy/canaan,k230-usb-phy.yaml     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

