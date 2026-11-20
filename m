Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162253;
	b=gpfptbRXjtANzqoq93oAJbz2uCjYidzhARyKUwFR/fuk+01+Yr2c7BvdApYXHfUZEleT
	 aurjrl1b7MjFjhb1lBWBHPgE/v3vLvTiHvV0kfSMmI8TBo9dNFpFIlAiNYnG70kOAQSQQ
	 +XwoZMFbzt/ZUa2t6jUgxx7bSbMQDlvlOmvU0o4K/OTC52BSXi/UjwlDXmF1yw+Xtfz1c
	 ++0fbbZTw86eR2RvK/5EJItithMAz4Hv3r4/u7CX9rSZTgge7VgNovpS2qK/o/S8gaIHY
	 W/Zr0xCv/qykJkEXQW16n37V+7/8OxKrsyGOWfIhxmsk7r4/13xFBL1UNKZgGi4SV2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162253;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9HncnQauty5t6nGfjF1ZTukarG3WvCIv81DxradHotE=;
	b=dUzQw1fLefQri5wUReFijkMuksRObS8OHK252eLZKxBiNhMOf08qZvuy7ez2vLNAotEr
	 kX4TN8uL3uxIOCLf9/2G7QIN4sPGwjhsvROI60BBZFwLDYN6CSP7kiorL+UZXH2H6Yf81
	 OJXDJaV7vvTcCz69iCPg73BQc5zQUfrYIVGKnLZ5QMUyHHH4NLtY0JlGzh6wsOEmqw+NZ
	 6698oGti4mC99323Oosh3uk+oT3WXwnHm2U9lRzRhSIxEF3ygKfa5MGlA71oxe4gEP0v6
	 XAbWt79UMLk7JGCzuJaEdl8bIyTZ2UKnXmSpPZJZZ35D3KPNlqtysqiTToAgr0V98EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="B/5lQ80Y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D38606A32A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B/5lQ80Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1F31F000C6;
	Fri, 20 Nov 2026 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795162253;
	bh=9HncnQauty5t6nGfjF1ZTukarG3WvCIv81DxradHotE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/5lQ80Ym2bhK/LsNJn09z6S1Y9wQWI8wSTpKO+0KLt1Oq4kwaADwxOcR5kWxBXbd
	 3ydsLIwyswkK7sW12DsaqsL+flKxqlo2Op3kqddE96xAO9wqgKUP8+Rcnz9wsWc/z8
	 pYLf6xT1ZO2Gvq80+EoSnEG2XrexJaNLt7zQ0+ko=
Date: Fri, 20 Nov 2026 09:10:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haoli Zhang <26031212468@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_midi2: disable endpoints before freeing
 descriptors
Message-ID: <2026112039-wikipedia-facing-056c@gregkh>
References: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
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
In-Reply-To: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>

On Fri, Nov 20, 2026 at 12:26:07PM +0800, Haoli Zhang wrote:
> The dummy_hcd driver keeps a pointer to an endpoint descriptor while the
> endpoint is enabled, and its timer dereferences that pointer in
> find_endpoint(). However, f_midi2_unbind() frees the function descriptors,
> while f_midi2_disable() currently only resets operation_mode. When the
> function is removed, an endpoint can therefore remain enabled while its
> descriptor storage is released.
> 
> Disable the MIDI 1.0 endpoints and all MIDI 2.0 endpoints from
> f_midi2_disable() before the unbind callback releases the descriptors.
> Keep f_midi2_stop_eps() unchanged so altsetting transitions retain their
> existing request cleanup behavior.
> 
> Reported-by: syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=599d4e8994a656eafe15
> Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>


Why are none of these people on the cc:?

