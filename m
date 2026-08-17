Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461E429037
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786977969; cv=none; b=n96XhcC5iU6ybLTE78nNp+uLgGmhxKQMQdWR9kP8uVhYHyJrKX6ytcwQBTA4BMsBFqdq2pWF9snrk1SJKLNQVM6pBzANKKutAxfyI/bYlhRCgQ0cQ0mQlnulFPCQshQudVRXZmWvLQjA8IATlcb+Q+4l1gV6DeE0b/F/3gQZwHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786977969; c=relaxed/simple;
	bh=MduWm0piicCPLJVaVl38wmTVcawPChLXhJfFlKqq6ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NR6DWrtZqMSYTC/oW3jUKJ5bXdU4A+/wcbba4ZpjkZRvh94tl1NgznuvCYw1oepKWOydqzd45lVGfu4yVIYyNVuG7nJmMEhChZu4kNJzECpA9+at73WgFhTzwHpmUcpee+wYIx0JisCgjAJRDAQyp5M3AdMrMGwYW9dH5QKXaXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qisWjA9i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qisWjA9i"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4994c49f588so31985105e9.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786977966; x=1787582766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5WfvTCVMtBGFuD0i/SGJKcgjjeNMofzdUgLOwyahACM=;
        b=qisWjA9ivd2ZLBUXkgosoRe5OmPsDC9ILM5SoQBvy5SzGtaFGloAqgkijWKqUHD2NS
         VzeLcrCyqWtme4rRjsrknJdh/wOUnQ+JFj0asaUTTenNUkrUligumOinA+iOKPO7gcIN
         KJlCJu1Ohmo2cXg/2UZID0LjzptSuTB42M0IH6C974OmItfmPdtgVjo1MG+tSzHceFzP
         PAhjKfO3UhHRLaDJVnamRvtOvYcBcOH58mZK7+n/dgysiClYlkDNd8xVOPUDAVApqb6g
         gxMKRi6YUMTKIjrT+4ewYFASVJdiuZqIIO5uGOtx6HH8AcEyouG7YM67qrUYB7w/owcv
         78rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977966; x=1787582766;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WfvTCVMtBGFuD0i/SGJKcgjjeNMofzdUgLOwyahACM=;
        b=r+CJwt5OmKiyRZhkd1lfxLF1Cp0KQh4lhLG21z15lLKUgDifLrQ06D39NsourqD2XV
         t9fDX9gF1NdNl3VQFEX4ChtddeJ1E4QOdoiFMN01Yg9dDi7wY1SJv5nE9Ba76y9hH1hG
         IsuGtp/hKf3d4qmV8AinYgYNHKTXLtF5+qFX+q6OivRqpSksUbTt/D/sT11lXsPewjnM
         pTDO6w6Mcupd9z3z4MP9FcH67eh1UYSlqnycpWWu7jkgpPHH8qw+/xwjBDl9X66BTkFL
         r9LWD1EB0Cj4GVZvyh6s2Hl2Oed5xueyu4W0QGGEm7tHTva4sulfZdDkTiWtdVZLFpzo
         je8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQwU1xKHX3wG9tTUlLgVuzwEvlyYOWDvHYHWYlyFEJ+1RL9X31y1bSTv0ZGYCm+5Tvb0wLDxbsSOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxopPIpWpJhFUG0M/6tZ8zUQmhR3jCSFaNHjnz35sHIwG8L6pTw
	ROm1XfdChY0bKoeEbMX4cRuf2BzVj86PrS7+wjEEby8oGwCGKjKhsvPotC9kyAaj
X-Gm-Gg: AR+sD10GjXQc2g10APiqHMiFDMioGSNSppIxXv8BUH7z9VNh6uTWomwZZ31kGn1nk5z
	xdxBjFESjfj9Ppi2w4kquGcJZBBGVZ8BLU7IzG6ZSLiLlSPvEUR4ZCV36VdVzt+y0AwvmoNi7RG
	+F9tPa95TXkmjz8zGnMNyNoXC4SUGPbEkQNBtUyuMQhks/BjnSRUTrZ2JoQmoPBrK0pelhufQ3i
	ARR0DRXgbHFJDzk+owR+PfaYQxxJggaDq9yO+zi6XCDqHcRPEcVRJqYtaYVBnVldCtg0o3TdbkH
	AT55jc65/P3fk5yy6U8nCue7LqT26I8IAOz83u3S1snWY+8dPyPDDjNgVrZKahNo/dMrAILcSr2
	25xJ2IOPq+wruufHRWPpQgJph8M3RHmDNUimj+lmTwjNEcJIYHL6OZMlsgPbvEltBzAkTwqsMbl
	bT1KS+FRvNwoeRY+V+zFD+dJziZXk1UJFSTp7HVxIO+aDXAK5EOxoUbW5uAnmhk5g5y/reI16JA
	5lcibMKMJ7NzY6gOfCwCK/Fpw==
X-Received: by 2002:a05:600c:4704:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-499922f4c82mr209964585e9.0.1786977965797;
        Mon, 17 Aug 2026 07:46:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0788dasm41047085e9.4.2026.08.17.07.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:46:05 -0700 (PDT)
Date: Mon, 17 Aug 2026 15:46:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Zimmermann
 <sigmaepsilon92@gmail.com>, Peter Korsgaard <peter@korsgaard.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, John Keeping
 <jkeeping@inmusicbrands.com>, William Wu <william.wu@rock-chips.com>, Marco
 Crivellari <marco.crivellari@suse.com>, Ethan Tidmore
 <ethantidmore06@gmail.com>, Kees Cook <kees@kernel.org>, Chris Wulff
 <Chris.Wulff@biamp.com>, David Sands <david.sands@biamp.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: do not copy_from_user() under a
 spinlock
Message-ID: <20260817154604.70427ed1@pumpkin>
In-Reply-To: <20260817061141.82597-1-gonglinkai@kylinos.cn>
References: <20260817061141.82597-1-gonglinkai@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 14:11:41 +0800
Linkai Gong <gonglinkai@kylinos.cn> wrote:

> f_hidg_get_report() already copied the report from userspace into a
> new entry, then called copy_from_user() again under
> get_report_spinlock. That can fault and sleep in atomic context.
> 
> Update the existing entry with memcpy() from the copy already taken.
> 
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/usb/gadget/function/f_hid.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..e4621e5a0b69 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -667,14 +667,9 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  	ptr = f_hidg_search_for_report(hidg, report_id);
>  
>  	if (ptr) {
> -		/* Report already exists in list - update it */
> -		if (copy_from_user(&ptr->report_data, buffer,
> -				sizeof(struct usb_hidg_report))) {
> -			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> -			ERROR(cdev, "copy_from_user error\n");

How about a patch to remove the ERROR() from the earlier copy_from_user()
error path?

	David

> -			kfree(entry);
> -			return -EINVAL;
> -		}
> +		/* Report already exists; data was copied before taking the lock. */
> +		memcpy(&ptr->report_data, &entry->report_data,
> +		       sizeof(struct usb_hidg_report));
>  		kfree(entry);
>  	} else {
>  		/* Report does not exist in list - add it */

