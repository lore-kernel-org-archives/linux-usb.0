Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F08E4BF930
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675259; cv=none; b=bGG3rrWdaUARdmldVfkdjiqQhdl6f0PJw2RqfRldci0ngE7jDBTlCo/5EEqkTwxDLS4S2WqMSI983J8PJlrYM+NK7Q0ihD1/5vJdhDZ0uufc1iuyFXWv3RUCCalElr4S6oEbWD+io56LEc7N8quVfjtH673XXr2RCv5JgyzeUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675259; c=relaxed/simple;
	bh=Mt7SZomNurAHm5m1aCwHi4vxh82+wXlBKSPbJLJjhHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t92tOXMekXq4EeMPwBDDf/tdz/vnWDlhOL3si9Z7mraQlRMg/rQ9KlMFasc6yUpwRQeomcrqJRo3IQOFXrWgF7PmXHFqjs4axEnlzC222h9ZRPTAPzGOsHGG5uJpFN1tZa3jxqvMV4I7N9hSWQzstJHoTfqtxPe1rNz6laSZxpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e9GTP+Ab; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uo2wjuWB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e9GTP+Ab";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uo2wjuWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790675257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9MAC6JZiAmxnJ/+3CjxUF3FBsOOD+FRcLr0XHqXCFJg=;
	b=e9GTP+Ab625T7/Fikd9HOipq2B7y85H4haYRUw4T6iZrrPYGmOLykDJMpidjrwndNU0dg9
	qVXaOVpw2LRu2LgdWJ3g+w/MdRKPSp97ZMoTWC/bl2bzp9C5TXPZqR7v9Hha65bkpsVkD5
	J3aMHo3ymh9b/N6V9dfx0ao6uFOEuZY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-8DvlCDy9M3-Czo3aORSLJw-1; Tue, 29 Sep 2026 05:47:35 -0400
X-MC-Unique: 8DvlCDy9M3-Czo3aORSLJw-1
X-Mimecast-MFC-AGG-ID: 8DvlCDy9M3-Czo3aORSLJw_1790675255
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6422198fso25970845e9.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790675254; x=1791280054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MAC6JZiAmxnJ/+3CjxUF3FBsOOD+FRcLr0XHqXCFJg=;
        b=Uo2wjuWBNjPY0r31kJiuelWwhiAxamODcJs9PSjNwcQbgW1KoOnB3G5FDBrOy6YfRL
         eRA43bv+iDZ05DYuGOO4+mx8qSrianik3SKdyy/BlQvDtKvYQyYpXzkPKBr99ila+2wr
         Ecfb3Xi0OoQDpi216ffqTUFWivHS3y/MJPFvHuc7OTExxVlH9Nr7FWMrXVmpmfo+zcsH
         05A9QPJ0A7cASjdgYUJBpX7nad18L+EGibF3rEOKAUrfrB0usW5HEDy3bO+vuF6Ylpb6
         2WUVvxQLfIl0rvbqPHrVKjnqxGiwKZR6XaFxponiQluWRwjBSJqvKvQ7uMrKEan2xWl7
         Q64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675254; x=1791280054;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MAC6JZiAmxnJ/+3CjxUF3FBsOOD+FRcLr0XHqXCFJg=;
        b=QpTRsizq348nKugXkNkp05QY3PrO16w1V6x0+x3w1TWroVmpM15JCq4ZxHi8t9LA4l
         slbymGddWNjOunXLHg6pwhzBRGWM2jIJNLAkOzfpGaUP+Ah542VILsgpU2cDsetRHtGa
         u9BIYD7hOsOEBE7l7+WluugWKN/OfHtgVpxdTOa8k0kztq3DWp1UPm1AgNlGGeqnuacf
         jVqpTZRM3B0xbao27JpgcW6eUnLHb5j04HrmVB4VhahEzT9uA75skpF83noYPVCXmGgA
         xDsyC6aj4z2NdZb7+0PEYE7lQM4lFroba70hlGu/We+SAUf1H7ZJbDKoJNMHzqXR0wI9
         zopg==
X-Forwarded-Encrypted: i=1; AKwUvBwiTqCiWp7PsKbYdSjWsH4haI8fpBI67dhp/Z7nvzhUcUtTP0xOL9Ongmh/nra0M+LeKUfQ+WAhrOE=@vger.kernel.org
X-Gm-Message-State: AFuF++kM35jmwfn17yUJ1ZwwyqeQycei53ywcn6GkkK7XNUmFyE2AD+8
	y8VOmcRpbCfSRBcF7k2527fw1JEUuUFnSiHENcUHUeIrN0JkPSQqwkJ1QF4g6MyDVCzxaE+ZEE0
	kozqgWrZs1u/g+dbBvQ4azOcqg4HFJ1m4zxb0n+pkyJO/Lju0xLTP3QrsYeAk2Q==
X-Gm-Gg: AYBFou1iluwkMf3hD/bziF+FdOAni2YWU2QUG4yjKeDxPBf0lt6UiflDistLvyd0leW
	kmAvZEh4KMLGIocYJgEqB88wUEIfpJsrdtQKyFVGaeY/gnNCoWPCmadVwPR/ThqH7glzP1VrySF
	dh1zIWHAYuGvAfqLY20Aw4e3HITQwGDO7Hep/jO8C6yRTzJK49V9oap7fUdPxweTExiuo0AtDgo
	j7s0jRbnX23g5WHc3VGNLzrEZVmEIbHSu/IO/OU5vymNBu4q6J+jRBT7pcZHXr0FanK+XKOuNAg
	WGa+QBEtLtObSaQqqeqpFlqbkxQgCJegBYCLKVrqObYImSW4ae6f3UIN7mqqFb+jmap65w==
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr279390575e9.7.1790675254540;
        Tue, 29 Sep 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr279390185e9.7.1790675254016;
        Tue, 29 Sep 2026 02:47:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf4598esm68532735e9.0.2026.09.29.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:47:33 -0700 (PDT)
Date: Tue, 29 Sep 2026 05:47:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wang <jasowangio@gmail.com>, virtualization@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
	Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
	Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] virtio-usb: add dual-role virtio USB driver
Message-ID: <20260929054346-mutt-send-email-mst@kernel.org>
References: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
 <2026092520-aerosol-brim-22d1@gregkh>
 <1149e188-7279-4c60-bd96-f8d75d721ae0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1149e188-7279-4c60-bd96-f8d75d721ae0@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 03:55:38PM +0200, Igor Skalkin wrote:
> >>
> >>   [RFC PATCH v2] virtio-usb: Add initial virtio-usb specification
> >>   Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> >>   virtio-comment@lists.linux.dev
> >>   https://lore.kernel.org/virtio-comment/20260924154007.143927-1-igor.skalkin@oss.qualcomm.com/
> >>
> >> This driver has been tested end-to-end against our own userspace
> >> virtio-usb device implementation (host-side backend) in two setups:
> > 
> > Where is that code and why isn't it part of this submission?
> > 
> The backend we used for the testing described above is an internal
> implementation that we're not releasing as part of this submission - it
> integrates with some systems that aren't ready to be public. We
> recognize that limits independent verification of our specific test
> results, and we don't think that's an ideal situation.

Supporting vhost-user with a backend doing pass-through shouldn't be too hard.

-- 
MST

