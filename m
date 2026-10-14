Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59C1549365
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988673; cv=none; b=qg772oKXiOZqBp2UhfBDlW1/7+LpelWeUzmKOKTRPpjWB9gX8KCLzFh9ZcJy5EUzopQ1pw8cfLL2HR7Onc4D9JY0yrz86onoCDHci0y0Ze7MEUBK3wQ1XfpiuIZzm4wemixWRvQFXR84gg88gXYDCL6FDwD6mVKGbhPR6prNAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988673; c=relaxed/simple;
	bh=bM+m8AsoZP0n+YQ2Y5JkPzEnaeb8naZAYhSxv8IxcJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgCkOYoFn7o1u8hGBW8xkA14zQDUSrSs+6vYrw9LX1NJDUezhBRYHvvOmoXDEQ7//Xet8Owj3ynM0CPIFTyIgRCYElTcd23ryJA9QfRQtq4FWwdnN/1Mw22VW6EbEFOhte1Dd0qVFcY/c19Pa+ndH36FHoW2VMbN47WA/qJDSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CYVUHctp; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CYVUHctp"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91bb5795792so3748846d6.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791988670; x=1792593470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EifbxS2BmqrR7Rw54E5hQBhB3vAw2L87AL8h/7ZB1ZA=;
        b=CYVUHctpCQH7HZzsVKrhKZM1EdFrvKuiLpClCDTsYIu1IttkGrMvuOOmN04dF0E92K
         4kY3kd1IoXnhbd4lDVEuebplA7qqefzlgm0fh/sxPHV780nAnuUmkKQplgAedsAYQGIp
         LZFqZV8U5Se/cniox0Y4kwoTTS08y6gTAUZX3YMaUccfXPSRgJoT6oAOu++VF94c+6cW
         3ZZIIkFz57gZu+wyVKk8MVFN7MpTYzdvZDH46YYrBYhzFu7Pe/mDW+wlOc72qTqv5GDg
         LFu2BHaYqwJ2PRaTu3QczKWjh25pWZ424bK6rLpwhetrtPzsF+3Sf1qQsG4Cd0bcCelT
         Ya8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988670; x=1792593470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EifbxS2BmqrR7Rw54E5hQBhB3vAw2L87AL8h/7ZB1ZA=;
        b=OD9kVXhhekkcV8MWV62lMXlvDDO3Mi+rKrH/aS9vNP6+/mrgW+PuhMX/PwTb8QRigu
         JeMGBt9E3lQ61xl4UyaTC+BWqV5NIXprfpBC7EW508cwXjlMFcnsrVDIFIdQTGc1HXlW
         iyVVzeuw1lRSMexdqZqx6XSGxE9oPLgqpirgIPfCl62ULzKiIuyiB3XWE6Kal8h/ULxR
         G2hUbKiFQH9BPPcPiEPehLh93LJWqWYvuehKw7cxUxD37cSiSDG16VFMfn2rFNAKq0kV
         XXM8x2i+u3brtBRVXIRu8xcSbQGxUMfrMp/e7af8SaRJ9VyHurkz1BobAgRNOLga8Mvq
         tP6A==
X-Gm-Message-State: AFq9FYIUU6aiw0I/pBZGuGiEjQ52Rg34e3bdKh+0UAjIL/a7U6CnFqa2
	Wp9cF4AtnRcwaSFbo3vZvmHqNOIDsd7pl69eyDxkT3G3aZZ0360lRGW8orEXir+m5FpTvhzqdxp
	MRRoagQ==
X-Gm-Gg: AYBFou3HEd81qsk9C9kknU4t6nA98QVtYzm89UnxfKWVWtsJ+Wk1lVdv4zPmqQ4oYhs
	WHZRdKSn089vZeeyDURcnL7flt6MYzuRluqBhBS3pSG+AWQGGtLGWcIvI0ZQrD1mlxNQL5kziZl
	qS/RoljED0QfQb9XxUHBTA/46X8siDGxOLLGlpPyCQIbjJ6A/W4P2CunsEKeop/ANHJDc4scrci
	AAoA2Hkj4f5piEdUtKq2eLpBoQpwoDqt7AVKOzAcWZ1RTnlw+07K1xUUsemLgDmlkoSZGF8xZKG
	KimGMwvTjXvoEjWcjgoUSxWF8eZ1NLDE0MsglDcgz2d5qGoL6VEtmukSfMX/pHncTc9KdQx4Pj6
	Dfr90A8f8zWoQMFBmx74Mb6ztkSggsHRCDe3hPl5VjQY92DUTifIdXhoH1qgjnU8/gNHUzToNT3
	gpzJsXTqtdsxv+KpArTKDC7JX6EaEN5cYtDZPjJvNAE7TOWPmHCyZ7Wl+wcZYvIMlkd4ONeKBLG
	EDIP4b6JPOisV/0dQ==
X-Received: by 2002:ad4:5dca:0:b0:914:51b1:6161 with SMTP id 6a1803df08f44-91b555062demr273855076d6.30.1791988670507;
        Wed, 14 Oct 2026 07:37:50 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ba33991bbsm35640256d6.44.2026.10.14.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:37:49 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:37:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usb-storage] Re: [BUG] usb-storage: 14cd:1212 returns incorrect
 data after large READ(10)
Message-ID: <b090f730-655b-4496-a955-c537fd7f544a@rowland.harvard.edu>
References: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>
 <1ff84ebd-f805-4f16-91cb-ccc805c8e946@rowland.harvard.edu>
 <b8c40900-c5f3-453f-a440-6ea540c684ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8c40900-c5f3-453f-a440-6ea540c684ff@gmail.com>

On Wed, Oct 14, 2026 at 02:09:46PM +0800, Xuntao Chi wrote:
> On 10/13/26 10:18 PM, Alan Stern wrote:
> > 	echo 14cd:1212:m >/sys/module/usb_storage/parameters/quirks
> 
> Can confirm that fixes the problem.

Okay, good.  A patch to add a permanent unusual_devs entry would be 
welcome.

Alan Stern
