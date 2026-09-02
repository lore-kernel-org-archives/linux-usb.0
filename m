Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0839F188
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349838; cv=none; b=adNwqvjaPhuaKq65xB/VSYjuy+RP4ZVuY80vKImWt1Bf6HskFST+Z9onS+HFTyxVifzMDx4nQZVJRaW/GCNh+AiDLqxv8gYMey+Gxc1ikeu7Kp4R7NY9lVi4tZKnnkM1+fNwMTYUXCumzYBRfLbalNNNaJbhQdafq8uVvnLsqpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349838; c=relaxed/simple;
	bh=bRKreWpcMXLX+Ys3siFaawotFDCy0D/FvdbEHwF2a90=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dubTetzyB78pFREKzjawnG9fdXZtoLyjOjGNE5bD4lQi6Wzh1hhRcEHAO2BJ0iU07/3JTfL2HX/Dwu9bPfDA84Z6J0qFsvgnklc5Q0D798QvmuP1vIJ/QYWWR7rlanp62OpBsew91z/8+w5a/jm3a8SN4nSuPPr3rWLRmsElTaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofV8z+/D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofV8z+/D"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so7667455e9.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349820; x=1788954620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJL40Jfdt8x+/9EdCeKzuEzietjlDBSPTx8iFjq4h18=;
        b=ofV8z+/DHjDwbNjMVbG1eVNPWrf/w/d3N8p5GsiOM+7D/S2+TqpYdggqY75R8W7HJ1
         0VSAxhACvKXaGTfeDMpmHPcxe6aNnC4JKBxxAVrQ2QYbyLdZSkAMRLiH9BQdxO1m6zu1
         sBcZwFtxqR5rsuiDTjjJruK4vgUukL3rx/ricmAzzXBAH22kDZwhu/blX9rrXt2I3tJH
         79Dhw81TiD+yaS1jBAWBHosjn61WQprZX59FezcHDeYZqJzraF3l0XdQBR8EB4rEs5zs
         gZusKw6pM1J65fwscWUoIL1p8aEWKnWFA+jtp6CoZBdfQv7OoOQB+lTkHDkBk3c2gE2f
         HC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349820; x=1788954620;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJL40Jfdt8x+/9EdCeKzuEzietjlDBSPTx8iFjq4h18=;
        b=JRJLJrhCjBQUO5J2DdMbiPPpmm0DFvK+DVSJowSZwn56nYOPmis+ON5LFTEN0ZqX0g
         qRSH6XQUTiZ8nZHfO2RIi+Ef2fU60f7ZtYLR7l52beY2Jr5IYj99SI8ZCzVA06OkOiMR
         ukrGEbG6HmJv8fUuDICNQtP15VoNKcWCxdTSinR1dK6MmsHnuUUDjeG+5B3pgC64mc1S
         Aa/EGpEEbnOteWcPbqMaPcm8a4mbWMDhvtI2IcJBj8uCqcn1FXYnMh01nsxKBfHaCR3a
         jrEmaRexsS90gz5gxugXBST+t9ptYhNL6QB5IPqOr9kldMOg92B8Kqye1WmL7Yn1IvQJ
         ucGg==
X-Forwarded-Encrypted: i=1; AHgh+RrPeyJE9p0wpbgHhLi9vXbaOtFeCdoNJYJUbMRlHsa44YBoiVBBwZ4fm0YEbhpXj6W3obuo5bT0hVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kp/bzvY5BOcO4SJe6EnUOz0Mwz6onYK4suBpb32K7EiT2ZLq/7
	FfXsylENCoB4XAkeIn5voON3P1UQzsAbaNxHjvAGIm9Y0LCK95DUeOF9
X-Gm-Gg: AR+sD10iH0qLUt/GFjy7pBW+Y8BPTIc2nt546sH9DYciziXcGL/ZSfZ1S7ROKzhTVkP
	LeumFC02NRr4QJnePM4TH9oTgT6DF2imEgf6ymiK0pKdr4aRp8COAXKDXoiTGULby1I43EBmHKP
	F3jJQukI2QgPYj0nAhBaDlEp3C3EwOB6lJ8X2Mt5uC3TKpmpdIacBZxkk4tfSYLd4sAIrio9cys
	MQAf9xouNVrsMAbnJI/39NqctfRphNnDAW7kz8y6qpxqsrfFOyl/YAA6xAASZLCaQJ0OihG/2os
	jgXDv3NLuCmuWHmUsMfg7CXh6eU7LTn9xJm2KDF2SpGP3J96sxIDelP1wN5LIrPPp55YbK02WZX
	v7jEUCMpyOuzXV3Q4BcIje3JUM2TYgs8dLT1mhwbbx7kvh5WQZhrr2lbLRvxEIqzx0gvZcYF64r
	nBewm93XlIVOrY8625ACl1C3GjoEEcjb+zoD3QN+jt8N9BMnmu6UIrQnYKI6kKfkXOcUCoxA==
X-Received: by 2002:a05:600c:4f87:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49ce7bb7823mr34356785e9.1.1788349819956;
        Wed, 02 Sep 2026 04:50:19 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e0desm155418175e9.11.2026.09.02.04.50.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 02 Sep 2026 04:50:19 -0700 (PDT)
Date: Wed, 2 Sep 2026 13:50:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Tseng <henrytseng@qnap.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: return an error if the host is not halted
Message-ID: <20260902135016.19d4c3fa.michal.pecio@gmail.com>
In-Reply-To: <20260902101510.30246-1-henrytseng@qnap.com>
References: <20260902101510.30246-1-henrytseng@qnap.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Sep 2026 18:15:10 +0800, Henry Tseng wrote:
> xhci_reset() returns 0 when the host is not halted, without ever writing
> CMD_RESET. Every other path that fails to reset the host returns an
> error, so callers that check the return value are told the reset
> succeeded on the one path where it did not happen.
> 
> Return -EBUSY when the reset is aborted because the host is not halted.
> 
> Signed-off-by: Henry Tseng <henrytseng@qnap.com>
> ---
>  drivers/usb/host/xhci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c28..2af6a7b91e55 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -195,7 +195,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
>  
>  	if ((state & STS_HALT) == 0) {
>  		xhci_warn(xhci, "Host controller not halted, aborting reset.\n");
> -		return 0;
> +		return -EBUSY;

That's probably how it should be, but I wonder how did you find this
bug and are you aware of any cases where it makes a difference?

There is apparently one caller (xhci_resume()) which cares about
xhci_reset() return value but not about the preceding xhci_halt().
 
>  	}
>  
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Reset the HC");
> -- 
> 2.43.0
> 
