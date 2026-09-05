Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357514C6EF7
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626152; cv=none; b=qS6wimDXORosxXoRmjzsYhG6LdHtMELx9NaXS2yTf/02Prj3uewGZdoLZonO4D+FxvJrE+9nNs1WE64wwfSLJPMaqsbjed1eXC2emQDMyy5MP3WGV+yf/bYfzDCH/XsHOWrq+DT/d+31aHKEvBZiEpTBhGP3aqDRLtfeX6Y9quk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626152; c=relaxed/simple;
	bh=RU3sMiyMMD6qpDbbKNpWFcTiCmpe28jjLPlDWBG40Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk3NLQ6GnbZK94VB2bDAq+0LatBT1jOlYaMSJ58VEQAgyvt/2yEF6JWj0SqjFzAdVSFH9srpt4ChI0GYKKfrpSRQ2iGSQ2FEw1sze00eRdi3roTadhqKjHcy7SDJYH/VWHIGm/CR7Huw99O8nsh6YLwsvQFawvLkz3EwerxFTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cNrS+L75; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cNrS+L75"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9399d91ee7aso21413985a.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788626143; x=1789230943; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4n9OW0HoU0VCB6kg9EkNodC6dxBpxHRpl2ni36wBslw=;
        b=cNrS+L755lCmAGXAc3uY06q6xuM+3RDSvZCaqw1sBEbanRGhpPmRZH0NPSjnN9rWqZ
         aH7Q0wJTf07nJ4et2uOGgS4JKTfuT5LoN5hAgt6TOS2NLPUn/fMtUxHMB9QdPNccSXD3
         46Ecuzbm9Hf2X5vb05ZGhyMJ5QTjQ9jrhjsrf6/+qlxCHrfCj4AstERZnv/rOGPtzeYb
         uTt/MGH08H7wnhHwo5JuDNUocUPmEzKKNCVNWbL9kbyQWDSIWSbqfFFy+iArNfKdoq8E
         0mD3KXC+I4RvZVmYmq7e8TkmlwyiePUp3gTX2eqUlkGZYJYfQXxslvfwVjolsn3U9XLz
         8NPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626143; x=1789230943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4n9OW0HoU0VCB6kg9EkNodC6dxBpxHRpl2ni36wBslw=;
        b=dE57qN3hvo8yPrM3abL0wGKg/HBK82SANUv/jHWCrQLoBJ1MqRQr0DiTplt52+UCx0
         nwNPLbHfLXx4GZeS678Qy7C2u20gKmtPs+csQM7au8eXiAo9yYyW2Z0omK03H1srNGuL
         9TBb9jvGoy4QVZ4LnwSxePoyENWqt03LWiXRqdLUWmJHTHhaIhbY1gNjhJY1qa1yWIvL
         5/kChiR8wAxLoDKs0PnKmyATBqTy2xRslMGvRgg2mfwU7ZSR5zlBSVVRRywsV7vxakwT
         SnG8tFEtCy/9OavCxp/7wB+XWBKi9CqPf+GXaHCLZAzbCIIJzkA27Zd3LNJ2gcdHM8Nn
         sbVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw74o/yZCiHULnViTR51fSmt5kYtfpK4R/ISlp+0t+4lvofBAzrlGVUhsDO9gHmTJ9Wa8T+BMOmvU8=@vger.kernel.org
X-Gm-Message-State: AFuF++n5kyRmhZPkO1ZL9LkncDvcTC2IrrT9+hM3wdEEd7kF4g/hlFAV
	EHA2sXW8Dw25gxPhh5EqfhwY2KAU2AOsZUkgzEa/SXxiken6fj+IUtZG9u4BpL3z2P063GLwfMu
	BvKhy8glX
X-Gm-Gg: AYBFou2feOf517L16Lhj9HBpbYbJJBxGthnKRKTYFosPNmIuSuNcA1Uy8YKuwZhIrmY
	Pvg+VkAkWBUlVBCHA+WR/UJIkX8yEcecpgqYDOY7bhcOejZ8GYZWNLkg1B9QQk4LBQqQHtWqYp+
	WSM2XgEbYQiDL1ZkMIet1NUyElHE3FIU5SxpOE+04Q/WsHPBOitpXpeooelmrHoFMxowypwTMzK
	Dbh+NW096Edj68Lfgbp0JWXyvBZyBidEQyBU/2fQw6eJDd7Q09lTgHi0jSF/OtQL2eVRl/wv0j2
	pqguUyxmaCe3Nls59XFKRNdk6QpeujzekMmjsuIe6PF5SrewlE0qD7eCBm7K/3uJlFA0ja82vKS
	zd5QPmZttJYzvMjqejy7aEczzQySh6uhMdqYM/K0TGj0Dfan4vXjryt10fn4ilvo51B6HY5CwiI
	zn3CONgdbdCwkXIt0Proz0Wntw+2Wppsrvgkj/lU4xULrL1sEygj8X9MqGyk/Vg8M=
X-Received: by 2002:a05:620a:7102:b0:939:779f:8418 with SMTP id af79cd13be357-9398059a92fmr1265069385a.5.1788626143201;
        Sat, 05 Sep 2026 09:35:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafbd99sm471171685a.7.2026.09.05.09.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:35:42 -0700 (PDT)
Date: Sat, 5 Sep 2026 12:35:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Adriano =?iso-8859-1?Q?C=F3rdova?= <adrianox@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/1] usb: gadget: inode: fix use-after-free of struct
 ep_data
Message-ID: <52df9295-9989-4a17-86ce-b3827f72ed30@rowland.harvard.edu>
References: <20260904163827.216389-1-adrianox@gmail.com>
 <0738d3db-3861-4eb5-9847-bde865a1bb28@rowland.harvard.edu>
 <CAMGU2hUOyoWAG-HVCvchqqc4R4uQ7QHaJ_GKGK+hUWw-=Z2deQ@mail.gmail.com>
 <c97a6204-5e6b-4306-a4f9-86b41c268dd1@rowland.harvard.edu>
 <CAMGU2hVGz9PwXhi+j3z0Zn0keUPt6Y9ArU38tpSRYw5ZHupDZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMGU2hVGz9PwXhi+j3z0Zn0keUPt6Y9ArU38tpSRYw5ZHupDZQ@mail.gmail.com>

On Sat, Sep 05, 2026 at 10:45:47AM -0400, Adriano Córdova wrote:
> El vie, 4 sept 2026 a las 15:27, Alan Stern
> (<stern@rowland.harvard.edu>) escribió:
> > Your patch doesn't handle the case where the gadgetfs_make_inode() call
> > in gadgetfs_create_file() fails.  If that happens, the refcount will
> > remain elevated because there is no inode to evict.  I'll leave it to
> > you to figure out the best solution.
> 
> 
> If gadgetfs_make_inode() call in gadgetfs_create_file() fails, it returns
> -ENOMEM and the error path of activate_ep_files() (where the new inc
> to the refcount is) kfrees the object directly, bypassing the refcount.

Oh, yes.  I hadn't noticed that.

One last thing: Can a similar race between open and remove for the main 
(the ep0_operations) file cause problems?

Alan Stern
