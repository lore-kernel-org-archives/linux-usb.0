Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD83D883F
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791251022; cv=none; b=rDAWmr9qAKooz0fsiiNDblIJdzH43zYiYbA3MbcAE8u2ZyAdEj4/ty7uWmVi3I9zs3XH7zHIZYq68G/JqFlNhx2Lxf4pTHFoHZKLjxQM2r9dQvNVgsDY6yw1u53tK6uFwYol1joaROF1Xp5GIuNH9BCU8t8O9ucmkD3IgNiN2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791251022; c=relaxed/simple;
	bh=wlRCdxdmT1QpgOSgEoaHnJDtMf33xlHjfNFOam9vtgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKXXvEe/ldY+t5vidmeTP/CdRokEMQJY9apRtZwONEpN5PA2izc+2du2Y2Z+O9bjKxSizHGIDmj3J3EYLS9H+mfggOrVYeKoatnGPTYj8An2djTOKyOZSQmdQNfkZQbJB5tiptqxWqawFBZu7VXGbB12dY6G4yL6ESe0TgYPuYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B3vDp/D9; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B3vDp/D9"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9144e8021d3so43721886d6.3
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 18:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791251019; x=1791855819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QDhXAIImJARr/32Tv2WP/qauLBAMu+ruk7/TkrTvv9c=;
        b=B3vDp/D9eGv7HCpvaqY1ywZcr+Zm5b09hP/5xmHLIKWhUhC2WRelDcij7o6CFR9iPq
         b8aY0zwHvdHl3+LgS66U3Qab2dKJVwSKvD5VfI9g53UdMK0ybtrEIdTKD+RgALs6XGyS
         qULbWEoFR9oStvQiMz3gCu5xX+mgRqQsMz0E3bViSsnCvejZZaGunRUbeErR1vilap7/
         h9xWPYM5+z1FIwdVTbQS9wNCjXJGo7IerXRDf5y37rf64YtURn2xCh44Hmw70oDb88uo
         D5Rjf2z/s98/hy2JKpCNtJQoMSt4lyMX4IyuDHBVp/aRYsgYCv9OcqZs6ZWwPKyOX32F
         n1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791251019; x=1791855819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDhXAIImJARr/32Tv2WP/qauLBAMu+ruk7/TkrTvv9c=;
        b=PaVA3YurIqdpqYmPcCYANLmpbuN3h7wG1lN8MIyvfkYEmkOeGJN2iFYLYGIDPH6kYy
         KlycP18Jt3wgzqwOpxSF6LXdYFgw+hRpQPd0kX6ZcVcoH7oDtQldR7dl8EwOVxyoVGRy
         fOXOufqTa8L4rehdMEldKq/7a9d/bt0WsvymA9Ro2yjlNrE2lPM3ZrpduivfWo8N19bp
         UwnyqV+l04r38YoA2wxI/cOynKEALmcDla0KSn8ZOoJFqO0i3ihXFLqUdcWBiZTA1Vw9
         0w1MsQYXBG4RWS93UyNGymehNDEj7XtqiN6D5UHt6QHmCrsF1zzfSiKLTb5X7//BJUwO
         fhyw==
X-Gm-Message-State: AFuF++leptwQiUFIGqbGPK7EothzeggL0Lipo+an+av8s8IHqqFwFGQb
	YKavg9AyKVWJ6r1gKiRrEnQRl7uYXq8edA0ekhVbZWOD7+NDBzet0gZsnxrkjkZXfg==
X-Gm-Gg: AYBFou3n8eTuB1f9+TjsBkCiV1xWwuyYQzu+axb9yk+9qi+wdlmnhBd2EvzxH/bafQt
	brAQaRECg159Wy5QmOkvcXQWat6TPIpAwCY8rSBoUrA9iaBaz4ej0FWJrpZx89L/pri/HZaqU8N
	RjoWT/ewjgwXR4klghPIAoU/Qe+Q1BpCrx+KvKlqzTqYIsEs5/OyvjNAkYFYO6eqRmhfrK4qdBt
	ukIBJVoJSs+bG8/t6BSAUydgRedVggqEgCASaSL5WqGQ2ntX9vouciT/+05K8gw1mYQtOFzJDcx
	7YqOPkfOWoBNnuamVGI8k8zwZmrA2mvac3SNwBUkHIyu+Hqsy1qLgsFKnbpDI3RpJNSavruM6N9
	GnBido1VRAq/bXorJ2reKKdGC9Hc1pRqe9kN0gHbE2o7TWIWnAbWMxncVQYzuklRpHAJjNYl0Fs
	tRwyubzms0XoD8kQxzQW/qhVdTHjGHaTY5250vXOZ4I+dpbpyAPzVoJqdyvLsbsF5KCvAZ8qsIT
	I7kxbp0tQ==
X-Received: by 2002:a05:6214:800d:b0:919:8962:53f3 with SMTP id 6a1803df08f44-919896259a9mr9483756d6.14.1791251019437;
        Mon, 05 Oct 2026 18:43:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c11022sm102300316d6.41.2026.10.05.18.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 18:43:38 -0700 (PDT)
Date: Mon, 5 Oct 2026 21:43:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: Thoughts on Sashiko reviews for linux-usb
Message-ID: <d38c38ac-1549-4997-9a2f-0df80f618a1e@rowland.harvard.edu>
References: <asRCTFE6gFlHBIu6@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asRCTFE6gFlHBIu6@vbox>

On Tue, Oct 06, 2026 at 12:45:15AM +0000, Thinh Nguyen wrote:
> Hi all,
> 
> I'd like to get your thoughts on having Sashiko send review results to
> linux-usb for patches posted to the list.
> 
> I started looking into this after receiving a reference to a Sashiko
> review for a dwc3 patch that I wasn't Cc'd on, which required me to
> track down the review separately to understand the feedback.
> 
> Sashiko is currently configured per mailing list, so any change would
> apply to all patches sent to linux-usb rather than a specific subsystem.
> 
> Would anyone object to enabling Sashiko reviews on linux-usb?

I think it's a great idea.  Properly reviewing patches isn't easy; we 
could benefit from a little AI assistance.  Well worth the extra 
exercise involved in hitting "delete" a few dozen extra times every day 
for reviews we're not personally interested in.

Alan Stern
