Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744305;
	b=JPI0f04NZYVCRLkl5icNLxCvtZygEeRy1pIP5faGedNKNJwHiUtsuehZetkWmf1om187
	 mmc/RS0KafYGP/qR1vshTHsvwueXGpIGMBNG2HTNA9tGmsCmvaUMF/TC6MQBJA2gk1n7U
	 MPdWbIV9EQ+1sN/Gr2G0fDDB5q6ZQ1V3yahLciOLHy1bykxxzMydwXj+/mqRZ0Aaa4zL0
	 QOM4lJv9esasRB9Otb7p9VpOGumOmbg3dz7tUuTlyCQTlFvvbpMrWaqy3auJwEcHisQQD
	 KLI/CJcj4xKAHRe0CobYoH3HmpaQezcBUulJe7A5zoVOOJz5Sk5bETewDYr55QDZmgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
	b=rhCJj8cibPjv2vGFsQJYYueQziuYGlP86xUrYd2ahA9pIP44Pc5iEEtJaZAPMjMNGOdc
	 NXJDao35xVVO3seIez5a1LjWDOu/bMJ1V6h7+NQHXQa/bnZWBhYZkZbkBHeWrNyJELLfB
	 9AvsOJd8ffGQvlW0Ba9m786gxZc0KXtEuJyQpx7/auaea9xtp00leVwHqNgnM23ruziVy
	 rDyNww8Jj7Mwxz1yxLmONedEh7xUIhHuVwUiskYyg6H83e2tQvnNeKjsILq08UC5+lBqX
	 0g0P9i+2ldVtsWSrQ0huPoUR7mCxnhCzKF7sex85E+1JUvLGMGR5KbuoFr+dCyoN9SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Q1I26F2i;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C3B606A328
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 22:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C3B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Q1I26F2i
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f259cdc86so10826485a.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 14:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793744303; x=1794349103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=Q1I26F2i7qTnQcDnp/V5gFkScUwzu9WDLkuUmT90rA1siQ07PmAy0n36nD8KQf95fr
         +tKyPWKhlOBBOda01+skyIJqpuuyPp3DDHSk/+U8hTD9jaIA7incIpQF3oHDAeQLGJpr
         +/EhoMfzHAc1hCbSLR5RTn0fOaCUXSz9sYEBauecZAKlJkreZXJ8NY7EPXYljr4Ywwgu
         jl+eovTps7y5WA2rITD+mO8s8owkgFMXwVS4dbSZ1V2+W5I2hBC7cQNezjeLWYI8xpjd
         NyCT8nrnH1kWYHF6iDbzzHQt4NH4+ML26MuJFOEhDbjPMihDs7qZPa47hp67ChOXPPCK
         YHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744303; x=1794349103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=KrwS1HiMlDuId57dYQGiJUk33z+e1zt56JHtozV4ZOIOSubDUgIWTO/I6uXBzFcg89
         JmYlVlYRkF9AejRoykNXho59wHi07m8HE13cEZKc4cDGUr3stqsyAo3XBoG9QLnQ+WGk
         z8l8jP86ZqIxLISlseFGWXaG9jECYywCYNMo9dP0VShYgpKaCYPMtfw0MnkKWZv93FKj
         B/7S8IAVY50EZ8ywrIoiyg8rVxLm+cMunbfi6s76XbR97NqmjJQFiZH425wEy1J4JMjP
         H8HeHXv11D87SViGr/TBs6K2vHolAxy/MKJDdLcCj0lETaxE8sotvTz6Xj//WDdOfMpE
         KliQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUpsDJRikLIpchqSqsw5gG8ggdPCilyMiH8l0MawVCuK1zHBSr9Cf0jjAMf5hKmX8dmPnLFQfaMfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oEMQ0DUEqPr8WA8IOqaRLVeq32pqCAJaM4qhkcdsKlbsCnz39
	ZkPGXSXYqwLIJPbUyQYzJNvZI/twVU8H1gnTCmTaN3nWVfCfVmGGF46iMcrbk9h68A==
X-Gm-Gg: AYBFou2uydXjkV7A/ouV6atszalt2nloy8GZ70aNYwajVCb0DJrFy8394TTCluhJwRn
	Lmhxwjakq465T4RlkqDlKSH911wvBoyuM3zKmf5oc3WDSxOhJvcVcla5Un4caK4G4PMbT6iiYoh
	MCqi5IkURjvpFqcj9hJoUApmwuTozlxOTDTMF/yzZNFMGgvwCSp80YRAvtHV4DuNJxsE3HQOft6
	7IfO94QHbbh9nFZKNhi5cM9ClvEQfy9yRciZDBxC+cLfpk5fF5Xt+a3AW9tzuFSx+FCCiUcVMla
	kBDnMsbhiQJLYPPL3WhwoL3/N6ydvfir2rI0oHvCjRA611Ol0FvHMK7MF9gzw2q/idkssv/Ss7K
	txkaXp6GefXMjZfbcPkB050/G1LtKbZhxY8SRv3D3rPKvCiraMMTogDutZKJ4D3qB7RjR1UMhO0
	mYBU/k0ngBCf2K2IS593UjNz8V4MT+OucQyNY0GtfPRgkSv74i7DuUXEemzX8xCrECRmO0FoxiN
	BsZ9WHc1sdJOgzks9PHI8wPpQyE7ypDDmy++lE5IDk77FbquOE5je5ZHjYzoD3DRYBo6hC/K6JG
	Xrcs8wKQr9gHBY4Ao8aVXB2l0AbL
X-Received: by 2002:a05:620a:3183:b0:93e:f4f4:346 with SMTP id af79cd13be357-94421796ea3mr2392800885a.39.1793744303281;
        Tue, 03 Nov 2026 14:18:23 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47e72fbsm40889685a.18.2026.11.03.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:18:22 -0800 (PST)
Date: Tue, 3 Nov 2026 17:18:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, michal.simek@amd.com, robh@kernel.org,
	saravanak@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-xilinx-of: remove the driver
Message-ID: <3c385fb1-551a-4717-a1e8-77b123cec0e7@rowland.harvard.edu>
References: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>

On Tue, Nov 03, 2026 at 11:47:21PM +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
> 
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
> 
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string, no defconfig enables CONFIG_XPS_USB_HCD_XILINX, and
> the compatible was never documented as a binding.
> 
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
> 
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
