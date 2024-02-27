Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17C1487E7
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709057239; cv=none; b=CvqJ4iVFaxTBgoP0cpONHHYoJ0w3eL6WHqEQUDJexhfUMNwRtN3KVGfLECdsCr5UVu1M8HOYApx4/6Xde45dSKtKr3tWgcCeFsGpirekPjyVMIz5lHDMtLOUTYML62i+XXeUMJv9x6wHX7G6u1dcWwz7XSBTjn80ywdBshz2ZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709057239; c=relaxed/simple;
	bh=B0ThNOh0lLLn+k0gXyPzhpIqqYghCNKgooGMa1SzMyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpjEoiAvCv2AWICwscbC0SzUVtPHp4xCxIhmn10Y/UFZPqWdU82VKM5hJ48C+ybTu5VN5olzbUi5luKoBADrNeW9XlKzYhnJBVzMbepkjmAyTxYh/zz2RkStkuTZDl9tCsBM1lHAdCtbOZRmjnmHyHfUE2NcVFYV9PRUU7/N6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IKWQ2uLt; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IKWQ2uLt"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7c7964d109aso174059939f.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709057237; x=1709662037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6+MUuGb2zmEv5DAM4fS96IcXlW7pM5/kqGwRmxcUuE=;
        b=IKWQ2uLtsmg97kTcixNrXaFWyZFcsP2rWqgkhTn5fo/SuM5qV8j/5tUVGGROtwYrU5
         yVj7B9bFm6xotDhbV7pBKkSezQx5vmnSqT9XTPTS8RiZtNuKx3o6qazaXxpbzosUAAU+
         kJWk+cGyWVuXOwXQ9nG2sNBp1LfToBQZITGV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057237; x=1709662037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6+MUuGb2zmEv5DAM4fS96IcXlW7pM5/kqGwRmxcUuE=;
        b=p262rTmVHp8aEJEGOhGEq8diMr5mf6fCavJOk98UFTxtqb8IZdu9M7dUl6qvy+BHUE
         rIGmP1AQsCruWRkKR9mBBtMXcy6fH1fufLEBs0ngsuNIh0UsR56ALpRfTPxsIXUUlfri
         tRPUxxikVHTTZLRBD29fElJWL/3dSNKH2NYVe8FNMQE3Y27E6yPcNnHmAx57rOVwQpBV
         vjezetmPFSL+qva2O++fGFXgoACJ6lsNE4+QSMje+qryqo6eXubjzSB5U8MVEaokkwk0
         91DowYYxl6iRaCfZ8/BhF+rRFMVzyodFocep2W9ADs2nDPZNuCYUUDrXKkszCUDUAFZd
         LvqA==
X-Forwarded-Encrypted: i=1; AJvYcCWCEbEJBkBitc6Fs6mwsP9wnWFjWvQw3ixmZhsyjmRZKI+WG5yrQMG0K03pcLle1db/K/BLgm0fn1q+LL/vLUklCdZpusxHcstR
X-Gm-Message-State: AOJu0YxuDr+dUC+hsf7nhT4qA1SyBEgb/bPUPbXJ5sT9/4UD/kBAlT4B
	8EpFUPg+pJ+/ijMlmXc+ujQAv0WarEjyNgoSgPqnCg/gpQHlTefCe+O3/MSw1w==
X-Google-Smtp-Source: AGHT+IEQdgN+oxQVY2WhNXlBaGf5tUG6zmnED4R2Bd3ZjsSu6BIoJ+KVjm1A4HgbPn4YL/9IXDzhfA==
X-Received: by 2002:a05:6602:25d5:b0:7c7:c6fe:d216 with SMTP id d21-20020a05660225d500b007c7c6fed216mr6816933iop.15.1709057236921;
        Tue, 27 Feb 2024 10:07:16 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id b18-20020a026f52000000b0047477ee4899sm1878140jae.147.2024.02.27.10.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 10:07:16 -0800 (PST)
Date: Tue, 27 Feb 2024 18:07:16 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Yow-shin Liou <yow-shin.liou@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add binding for TI USB8020B hub
 controller
Message-ID: <Zd4k1BlWDz7nmc6o@google.com>
References: <20240227090228.22156-1-macpaul.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240227090228.22156-1-macpaul.lin@mediatek.com>

On Tue, Feb 27, 2024 at 05:02:27PM +0800, Macpaul Lin wrote:
> The TI USB8020B is a USB 3.0 hub controller with 2 ports.
> 
> This initial version of the binding only describes USB related aspects
> of the USB8020B, it does not cover the option of connecting the controller
> as an i2c slave.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> new file mode 100644
> index 000000000000..8ef117793e11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI USB8020B USB 3.0 hub controller
> +
> +maintainers:
> +  - Macpaul Lin <macpaul.lin@mediatek.com>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb451,8025
> +      - usb451,8027
> +
> +  reg: true
> +
> +  reset-gpios:
> +    items:
> +      - description: GPIO specifier for GRST# pin.
> +
> +  vdd-supply:

There is currently a rework of the onboard_usb_hub driver ongoing to
support the actual names of the supplies, instead of the generic 'vdd-supply':

https://lore.kernel.org/linux-usb/20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net/

I think for new bindings we should wait until this rework is done and the binding
should have the hub specific supply name.
