Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F157357CE8
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 02:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785550391; cv=none; b=W0Ty4ACWT9yINVQNnbv3viKXbVuXbgOCb4vY/PHJKvnUkdDpzNF0/U3gkLoE/oTOp8UwBLsMxyW9K6Y769J3vM/5qGOmwtig0CWJnjdDH7epkWdZrJ0WgKPkyl6wEk2hbFEpliF+7Reb7Oaap6yM7b1Bm5sXUQ5SYJCmtf2MV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785550391; c=relaxed/simple;
	bh=jPUp5TUzq1rYxWEce6H8OahG+2LxUwinUpl9YWB0zWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjWqVANzA1rnUEUCl4ftToSy8Wj314LzGnLg1CfMPshyfYjI1hOMm/oaT5clIaYD8HPc887adx2LSRBykaQJ1PkycBr1hn+ZwQw/h+0z1TWQ2ekhE/V1bF2ZqnZmNGTcVKwdFiSKX0612O6dd264K/dG6Oy2l2B5T2m/IeQ5J9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bTo9DSEe; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bTo9DSEe"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c0ecfaee7so9994251cf.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785550389; x=1786155189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6n3m0I16EPAraX8htgLzqQEdt0fiT6I3xg7iIpA4NIc=;
        b=bTo9DSEegvkHuNyuYgWsMblARBC7D1iM3VyQCP0761aAQp1ogE6ghazcDAOeIhlHFL
         JmsJC3kfiPYPoYMjAzwT5WmRzAUTCg/ctfsjIR/iMCAYY4M7NK1Hn4DzL4f95ioDjabX
         zFs4l7CENzukz9x5oz/Ay3lVaNnwOC0AZwwmYEEJf2w/4jvIvZf7o2MnOLzhLB+DcUmk
         cXf/1zXKkU7HAFzFqZApqZ3u/wHGX34nUMLbHJ9kZyhrMtYltWyuA5RzBkFtD+cTc8NU
         BHmfJ6P20h4MnRG5iM5NkRN4zZN8Y7BNc8wuVGyk/l9+nsWdBYU+95nuffDiaEnUGhYq
         ElOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785550389; x=1786155189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6n3m0I16EPAraX8htgLzqQEdt0fiT6I3xg7iIpA4NIc=;
        b=Rmc8HcMkX7ZnWE1evc1+2ow7InMbrC9swJ5szTcpuN/BGow6ILtEcP/Tm9NuE5yITp
         UQ+YkJA4jnQdXX3pmE3KLz/xy2u9EEM+kJ5/OkfpFc/ZSAqEq5V6LHvgC4YUrlC7ZioM
         0SC2NffH47MXfjxtDDAMu0qts0wcdUFvU8dRkIZdy+SkFZ9kl8DLwufDpoTNoLvGKYzP
         Z8Vgc1MqgfX+4Tq5BNSrT7pX3DAE2/pCWffIBoZ7LR+x+tPDIeB63Xquog0ZdQTzezhk
         M2RzfUYpDY8+z5UenbkavVhBal8c77ShFFEpTI0jcOR9taYpxZDS39WM4QqPlM2ueoBl
         3U6Q==
X-Gm-Message-State: AOJu0YzYYE7pzOPxK4vJXynomSmIT8OIYyRpTL5yPZ7buwSbnfp3zdHF
	645KBI8YK+HBODQI5KSrRNyBhmqNMW0e05NsR3gyHZdd+OOomH6f6mEzxfikjpJJwg==
X-Gm-Gg: AR+sD13UemHj0Dp211dCP/i1unDMuaU9E9C9PLOmXxv2DkHgN9UdpKZuNY3JvpwLUE3
	5J4fs5+eeDtnszsCopFtzgRA6RXYVhHqqEcKj4JHcXSZDIpF8hoCf0lfLq5OsWVIIOBXgo4EyQH
	ljNASVkXfKsSFM6ZD36WG1f3zJHIG774NgECYBgn3JWlOCFyEPTBndmekbsFidmZjMsw6i76AQX
	3v38/OJnTPcdMZRsRLHdQKQ8xeCTkjxyUI9rJRoL8XaJJUlpdaTDlV7Fu4W9J2jDgqRXwdwa9ia
	iqPGvtDAs4xmvRGb3ZPl9U6/iH7IOypnuP0snocLwIUVFZcuU3ywypeRPNKG59h1i8pvtdxSq/2
	ZLnM5/R28IFqY+39JLDL0myEcePnGiFuTUwX1XeJDuGj4VR72KS/mWvuX+pauurxLf+/oIf052C
	wO7Ipo/Y46IVZZR68ePryoonweoBhmEto8/ErcMmG0z8gy1w+ndAMUNC7Jpuzurw==
X-Received: by 2002:ac8:58c5:0:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52b5669dfcdmr46632721cf.3.1785550388744;
        Fri, 31 Jul 2026 19:13:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4eb956c3sm19591651cf.22.2026.07.31.19.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 19:13:07 -0700 (PDT)
Date: Fri, 31 Jul 2026 22:13:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Deepanshu Kartikey <kartikey406@gmail.com>,
	Aleksandr Nogikh <nogikh@google.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadgetfs: fix use-after-free in ep_open()
Message-ID: <2be6a758-c34d-4040-9c71-eb929b379fcf@rowland.harvard.edu>
References: <ee41fbfd-f368-4a06-95d6-ae9b4267fd82@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee41fbfd-f368-4a06-95d6-ae9b4267fd82@mail.kernel.org>

Deepanshu and Aleksandr:

Have the two of you seen each other's patches?

https://lore.kernel.org/linux-usb/ee41fbfd-f368-4a06-95d6-ae9b4267fd82@mail.kernel.org/
https://lore.kernel.org/linux-usb/20260731230603.4637-1-kartikey406@gmail.com/

For what it's worth, Aleksandr's approach seems simpler to me.  Can the 
two of you work together to find an optimal solution?

Alan Stern
