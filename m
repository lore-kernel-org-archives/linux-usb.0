Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B98165F1A
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550077; cv=none; b=LBrqivJCK7+KPvP5RidxM/SP0GGKu8d3Nl/0RmQmEtmisd2AaiorCzlHeiktIDlN7wJZDeWvOom0ZOueMpEgv7hM3J0TVonc9hjxsRzG1yM3tDi/29V6JjMN1gcjg+hz8Oe3vnNpDn80m2hxXwM4drLqtDGqiBgbwTBiMwbIn2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550077; c=relaxed/simple;
	bh=u68NBiq0mrBwQTFwffkT2EL8PhqVYvcIlRw9rB8MPGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijGWktFL9yGMFf/mRHbUgljZBlF7r0h+CSm28jwcVhd6WFjSpN3mh4aKhSOgGVPRGTiUzsL76k4xQ+lydUxZLp1AvzPiJfYWn3kP5+bm086+cMgIWpsrCW7yu6cQW9gs2cfhbWYgf+80cfy7JEnVfyDCyAGej78aAsXKPzQUN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wxP5EjHb; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wxP5EjHb"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e85499ffbso112309285a.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788550075; x=1789154875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yu/594u+NUy7LoDoQLfsNT1TOlAwvGEoeY5zey+W18o=;
        b=wxP5EjHbbWXmUKCdvCnov7FXIWGExFtXRvBaHbGy1AkbHpK47KkxhcwSxwU4h1/59e
         JFEuYONgAAeUGtCJwwo6t+8hH2VP8G7njQzm+dbD+TBFGuT/qenjQuXC6LfPMLSvq2Fu
         yOg77ZkzKzHiUPhAmeMFnbxmUr50tFXRCnqlQDk/hOu3itCUtBCTKb758lsyfo4K5kLI
         cg1iOktllpbvvunxXBwsOcB9MZq5/gbuoFJ5LObA8FfNvG2pUqMBW+gbPX/QP+F8LT4A
         KboIyKbRY4aQ5zvlj5QtzdCHYwPQpBXbF887bAUijQ7Avv9kdikn2NRan/sHN1Cb95/a
         Fw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788550075; x=1789154875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yu/594u+NUy7LoDoQLfsNT1TOlAwvGEoeY5zey+W18o=;
        b=F8BixDhvBPJvhWy2kChoEq0j68qOYvpwk0k8hte1RNJwnwsa+5KA3KlR34t6Hldgmr
         MfqzwdJvMNMlto63/CE4KilTrl9F0j8o1Zyci3bMEYOMvZSp9wfauzFzM3IHzVeADTi3
         mUIrqmSqCNzKQz/YCpxN++e3jdcazq96dAma2oVh+vb2W46Jo+7/uRZkpKTD1Hiw1TQM
         b8wKXDvfhYP96z4wmqW92UJzm9MOusXmb+0x9/MrEveQ8Ymawd0bR//4E+TFq7gHTyyr
         NDEgEaX4Dmsw/LuAIfSFYsW5vYkuIksdXkkjSR9nAYlqs31QBWFSf+B+U/ptGoxzdapQ
         D5yw==
X-Forwarded-Encrypted: i=1; AKwUvBxKQla5lKYszg4iu2R6L5kcmcTKAxj5qHZleo6DQ5wEBnPw42E+9/Xw2viZnvQh2iUcQh5+onLSFjk=@vger.kernel.org
X-Gm-Message-State: AFuF++lBK3pWk45N0rN1YPh3/FyHe63dNTnwYM1NYWUFyNvXV7/AadZ7
	X2ZD5OqqParXEUVIqrf54ZVJ0iV97CPR1PI2xlBwdNK4uVXMuso42HfmWx5RJJHP0vY0MuSdSBC
	btrdU5A==
X-Gm-Gg: AYBFou0wV/2ArotwuvzA9PJaITmkZuP2pxQEPZzQkhnlAB3/GNnvIcbSsmsD1+HcQDD
	vLm7p4uJclf083+t9s3lQujxCjz/b8f3dzCjSm9nfQP3P0ezlUzMq4zQx+CH5FDDsySUMHs5lmy
	CG/dgnIgFhLby2ie5rD7hwnGHoHbEddBo5ZSYYjYPiXHcdo3npHb3GEmXWYHe07PBF7Iq7BTfsv
	9vkxB/YUpt3NVmyy1AjAgg2yMVUx3SQ8iGmxJMelM0VAiwMWTZTyrvmqAAwFBtWtsvNU+eUpK1g
	yqtdjtN8S6G7FNQIW0RRcR9TY7is1nlC7UTIY3kOg6WDvfynkbbGtN6vjU4KW3xiZyqT7QzreeJ
	hTkeoqWLmcZ7DhIZCoO2B/vDs7MrrunS5wUkpQFGwgY0KDoRkm/R4hz4blHUbuSnIWIbdszrGrx
	LtZvVjltqhJBJJkYj6YpQBhBjOcE8LYcKzmxotVw1jr+9aA4HcuSZR7AdhsaFlVw1W0E7+GwRX4
	Nc=
X-Received: by 2002:a05:620a:269d:b0:939:3a8c:28f4 with SMTP id af79cd13be357-9398031e61dmr846105485a.10.1788550075129;
        Fri, 04 Sep 2026 12:27:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb62710sm287673285a.28.2026.09.04.12.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:27:54 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:27:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Adriano =?iso-8859-1?Q?C=F3rdova?= <adrianox@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/1] usb: gadget: inode: fix use-after-free of struct
 ep_data
Message-ID: <c97a6204-5e6b-4306-a4f9-86b41c268dd1@rowland.harvard.edu>
References: <20260904163827.216389-1-adrianox@gmail.com>
 <0738d3db-3861-4eb5-9847-bde865a1bb28@rowland.harvard.edu>
 <CAMGU2hUOyoWAG-HVCvchqqc4R4uQ7QHaJ_GKGK+hUWw-=Z2deQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMGU2hUOyoWAG-HVCvchqqc4R4uQ7QHaJ_GKGK+hUWw-=Z2deQ@mail.gmail.com>

On Fri, Sep 04, 2026 at 01:31:29PM -0400, Adriano Córdova wrote:
> Hi Alan,
> 
> Right. But that patch makes the inode the sole lifetime owner of the ep_data
> (deletes the list call to 'put_ep'), but ep_data is also linked in the list
> dev->epfiles and that reference can outlive the inode (it doesn't happen now
> I think, but only incidentally).

Okay, I see.

> So in the patch in here I decided to go with a refcount approach, just to
> be safe.

The patch description could be improved just a little...

> El vie, 4 sept 2026 a las 12:50, Alan Stern (<stern@rowland.harvard.edu>)
> escribió:
> 
> > On Fri, Sep 04, 2026 at 12:38:27PM -0400, Adriano Cordova wrote:
> > > gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data via
> > > put_ep(), but the inode still points at that ep_data through ->i_private
> > > with no reference of its own.  A concurrent openat() on an endpoint file
> > > can therefore reach ep_open() and dereference the freed ep_data (the
> > > mutex fast path), even while the inode outlives it.

You could mention something about the inode's lifetime and what causes 
it to be released (and when).  This would make it clearer to people like 
me how a concurrent open() can race with inode destruction.  But I 
agree, you're right that the inode's pointer should be counted in the 
ep_data's refcount.

> > > Give the inode its own reference: take get_ep() when the endpoint inode
> > > is created and drop it again from a new gadgetfs_evict_inode(), so an
> > > ep_data can never be freed while any inode still points at it.  This is
> > > also safe against dcache pruning, since the inode reference keeps the
> > > count >= 1 until the endpoint is removed from dev->epfiles.

Now it all makes sense.

Your patch doesn't handle the case where the gadgetfs_make_inode() call 
in gadgetfs_create_file() fails.  If that happens, the refcount will 
remain elevated because there is no inode to evict.  I'll leave it to 
you to figure out the best solution.

Alan Stern
