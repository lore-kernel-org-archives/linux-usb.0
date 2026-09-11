Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CACB58F071
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158108; cv=none; b=Pzf88MNC7orGMgLSPbxqIZcVMQrbbDRmyVMrMU7l7Zc246wubvKbLjlh2yUTTQsnWeHcoGy9Qzu7DybDS96WWi1eyHWfYNIOhZPPfB8Zd7zqPiIA36kLG+z79RxUUjYyODv34UanE8GUtYKh39iuZofHbPOCOx1nF68T8ecmuwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158108; c=relaxed/simple;
	bh=Ca9/izA3FjlAoYJlmuOoQGtoS+55Tlx0tj8br2RzLgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVEDd52eldDj5s95cvrxTR0Wfjy7u9UlgCkwU2I4kb5y1K6vq83MFdPz2Px3qcxTcbPgWD01ZbLL3k17pgbEgdUGu1CH+vAxqqRscgwS7LkCMCr0rSuGMxQ6mx/NKGd5oLRHNKw1fZJuMb3MSjVexuQEamiVm4dxLJ1iwUJplss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9cpX5YV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9cpX5YV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso2889355e9.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 13:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158101; x=1789762901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ggS1xl7+ynzYo99JAndehGpyH5R/ofM/up6tpQ+9b4=;
        b=d9cpX5YVrxPsIxOeS3/vuksUz0xCZyhgfswAHJH/GdGww+sFLtQwo38mm11aagcbtk
         PFMpgoILp3KXLgRAbnvHJUxkdlyHI/JdR2mp/SYSOPupx9CLhLUfm1jzJ25h8yRYC13l
         kSHbj6jeGwTwEwUPg06stQnngWapUwLqWEwLq8szC++pInFbDCYO4wooY/xGIwX/ELKD
         EXj9p/4goGQkW33J844s9Fb3QMkgUdcw4GtnHgHE6K54Sx/+tL74zPKzKDTP6AwRDzXk
         aeI9PSamfDSf9mJ8g4k/3cB5ZgzcuAMq5tXsghxm0zBuUT6RcMxAnz+CmUdDMISuNi3r
         NGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158101; x=1789762901;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ggS1xl7+ynzYo99JAndehGpyH5R/ofM/up6tpQ+9b4=;
        b=WIlqH1uR7FW9KYzkRy2JxBTSh95Tqk3YZ5YcwMf786BZxTE7Pffez+LEfnVMC1IUED
         7DHw8LNoKhgj8YXfEtTvO404UK0nUoz6PdL0NURAX4z9DeY8HIlOrHQtyHJXlWwNcXXZ
         52jP0Ag3SrDNw7eP9pifoPAUyUgsEpBigCfAgF888uvALbLOqvVUWWlfBXW+U24nNjhR
         9AYQnuK1J+v4jI0C4Ra1NTGrRnUEiUlyyMWxOqyDt2rK2aQ0xuMFUXHjfUmL1O+5v8T9
         R5JSBMev8fZSgy3F94rzvE7EwBCDRRgAjby2HKH+7wRrAEETB1ndsgHdUHILzdH0ZLKo
         9/2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVFaiKgM4zzq+c7zASxNxM+3RGjjK9URlYqHttPD+/h+esw1Hnmz9Pt3rZ9hiJXTwVlcw7TGIZJYU=@vger.kernel.org
X-Gm-Message-State: AFuF++kRGDdUl9GooK1lFlNNsIZOocz+NR+uoxGZHA2EvfkURzfs+obK
	B8NFf1QankvcKmn+U+Hv+D8FKH+DNsKUPq+DaKZ2N+FbzvJ76DY2WwXj
X-Gm-Gg: AYBFou1QoU7oS92FVcEMuVU+iEeZ18Q2m8qt2FsWeVEPPSYyfW3Nv1e7Ry2cmHJU0VD
	cMj06f0B9csXgCN8NQ9j9wKwm+NMwKko9L7iJcj/hWapODhW8ZQVNukBWHKt79Ln69Dvu6vysKE
	Cbwz67IWc0BwLiwK5VUExF0IinGKWSUJT2cynZgDcjrYn9Ox7A7stvTYqxpnmc4GxlM/+Xxdb12
	G6pmA/dY7OaNkRSuWam8feFo+t/Qy6hgKBXFryQQkbQnUkRt8JePPTCiYrKQyD0Sicai3Kgph5F
	d02WtmZI8Zu8CQbj18rcHWaQn4lEfDLK5gjJTI1WUUyk2sW9K5105g8UQ99N9GHavtaJSwSyHkW
	l0i25VEvsDCXA5hoKJ6/YfzpD/M6jiiWsFH8cNJDg12Ao+EJ5cYbUNWuCx5fZk6mhhXdOZHfrsT
	pB+I6NLQZVntbZnqgWCFQ/Ly4uRYU8dZNrB7N7PN4QH+azMC6ysfXlSHuB/s09odziDeZ2UHFnm
	A9ErhQ0
X-Received: by 2002:a05:600c:8a16:10b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49e61999d61mr52902775e9.14.1789158101298;
        Fri, 11 Sep 2026 13:21:41 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6221963dsm60242235e9.2.2026.09.11.13.21.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 11 Sep 2026 13:21:41 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:21:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: EricLin <ericlin050914@gmail.com>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI
 Prestige 16 Flip AI+ C3MTG
Message-ID: <20260911222137.6639b397.michal.pecio@gmail.com>
In-Reply-To: <20260911144841.5047-1-ericlin050914@gmail.com>
References: <fe9a4727-52a1-4464-9fe7-c5f50d09713b@linux.intel.com>
	<20260911144841.5047-1-ericlin050914@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 22:48:41 +0800, EricLin wrote:
> > echo on > /sys/bus/pci/devices/0000:00:14.0/power/control
> > echo on > /sys/bus/usb/devices/3-6/power/control  
> 
> Sadly, These command doesn't work

Hi,

Your log looks like they work - nothing is being suspended anymore ;)

Do you have any idea what kernel driver (try lsusb -tv) or userspace
software is using this device? It's quite possible that the driver
simply requests a reset explicitly, either as a matter of routine or
to recover from some problems.

Regards,
Michal
