Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CC34D38B
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787678207; cv=none; b=CF0kLe+lFV/FdPfD5NvqhjnVtg/0vs89J3xecuYTZUn0Hd7x1RT0CiTop6GjDN8ObXnVuXtZhMxp4Ickkfb9gIonSwehkI1rbNzaqPOW13+MAfLicr8fLbxo+2OsVMiEDT0SlKn9UQtzh9clZK/jZ37QBtnsJUKLI3iXsY8v2G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787678207; c=relaxed/simple;
	bh=99HbLagHbMfIbKQr6E0eGPQiqF2/BQCDaKrbOTg0DuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eh4UEzjSmMMfvMW3qiuAgQVXNGxFYGq4aBE661ysiKiUso00JHK9L8zcabtIrXV6ZWXJv6Pk5YNVn/BAllqWrhw2slZEURJu23vOdTTSSE7WfpF2nOI/su95j+NS6pMr3ufw+QW/mJZP1PhPsVgt1JOquKEDKuRaAQ7Bk13UoI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdKq8FhO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdKq8FhO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so1042835ad.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787678206; x=1788283006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDC1IHSYbfFXOzEOIwvgdWsLVsv5QpurBF1WjMUS3fM=;
        b=KdKq8FhO822XHPdIZqLo0q8h5HQ4PJsB+xcb/ZdPoSzHASRnOlwp7DboJA3vFLm7Of
         d9PuKtZoc5/vRv4ITp5iZuwTO4msqaIi9HFljtZdpd3IxYLCVB148Pkg65Knm6P5z/3/
         reoa0BEZOB8zIAFXKYtoDzV50CGaNaeHk5hUeoXBgaiX5ReCn9zaUvXJfYy8YsEOGsdN
         Md/hAw1+lUE2bxncAhZutQy7igsZ5Dy2yGHgwKrk6jjQRBXvtrk+xarlG0YbMuRUhq/J
         vlI0Mwx7GjIcxZCtYaj3ve+UZs8ZY8T3r1cayMd5VlIPMEI04cLhxPETuaM1HdBmmvR0
         flaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787678206; x=1788283006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDC1IHSYbfFXOzEOIwvgdWsLVsv5QpurBF1WjMUS3fM=;
        b=AHYE6dIjxBE31xtXqBM5sHrVx4D0S/tyXqSuAm2wsrdUySiRN7pzYLJmHqXI24DChx
         NXLEPn+9gaq8kRD0RhVVYpsqax6rDV6WaotsmK7x3vXh+wiowvqcu2WUNJY/J2wV4YDv
         VnXWOVJAWEMezvM0zLlrw4Me4R+U6orVic992PUQgR47T0K7qNKkDR4T3N+dAHgqfA2E
         8+1cg7Nh/lhsN86aeyLDJCWjvcWhlKMk2lKw+T+3ss2zHbLWWUYHMRGl5VzJoMMDsTOL
         TaDzWA0YK6lkkFnqMw7vQukeDFd3guwoDORwV4kUrx6sKsjA2o5mfebvv4TRSi6GzK7f
         4n9A==
X-Forwarded-Encrypted: i=1; AHgh+Roqg+ZVNO56kglQbzh15qh82aWTKpadISYVBWKXjrEO8MfQUy7Zt+gW8F06NBDqaQEQr8oQ3bIIvf0=@vger.kernel.org
X-Gm-Message-State: AFuF++ldGCbq2OSAzYIaiUxtaLKOqqb6VlemulohN2rjoBFhsitsbkRI
	23b/tNVRjhGK6EoP7Eklp+tXnPemhTyFuNzAYoY+YPKobe5aUGSMALCf
X-Gm-Gg: AR+sD137mcJW7P1Z0bkQXO+o+3+Sf+R6YKg8HXneAFKAOssSmaf2pT0QJjdHh581JGE
	hHhJwa/Wfpi69oHJnJAEDntqvIIUi/cI9HOlncTcYXIxHJI5hB7rqct2CZi6A/oMtGV4CGl56C5
	9Na6l9CFAr7pgcw0jxxaBg2vmGxXu55KkqMnIIOZi+V5J7eEuV0yTw247QPE+L9kNGs7b8Doy4V
	ahEqsw09ix0vaWDSfNm9UacJNYkavzPvl+WuWSRXR5HR7F6FLfJnF6vFwyt3X7Bynw54DO6p11p
	NZ/h4TvqPsQsJStvjOkxvRhXKiBL07ZmAHWiXo+ePa8roBUudXpaNp2GXJQbUX0jpfOzT4GzIjU
	pTAm9AnYS2TmclrXyMYtBrtSTqZ8XLJnQrBRqnlL5Gueg0oVG9y1pkNXimMjThjISV6a2ynmb70
	SCxkKt4hsmd0ID19Mznr5q+bzgzCXjPrqAl4CmA1JCAyLnzl+avNVENnF5YuupOv6lhQbVv7+UA
	+gSV+YGwFosIOtFIBo8ww1wunjWTE5A
X-Received: by 2002:a17:902:f686:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d670c96265mr465462375ad.9.1787678205677;
        Tue, 25 Aug 2026 10:16:45 -0700 (PDT)
Received: from localhost ([2409:40c4:13d:8046:4d30:e4cc:47a7:83a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d9e5fb1sm572758eec.25.2026.08.25.10.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:16:45 -0700 (PDT)
Date: Tue, 25 Aug 2026 22:46:40 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: jjy600901@snu.ac.kr, brauner@kernel.org, eulgyukim@snu.ac.kr, 
	gregkh@linuxfoundation.org, jack@suse.cz, kees@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mjguzik@gmail.com, viro@zeniv.linux.org.uk, 
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: fix NULL pointer dereference in
 gadget_dev_ioctl()
Message-ID: <ao2-6IlxkmQbf96H@eggarch>
References: <20260824113510.1141236-1-jjy600901@snu.ac.kr>
 <20260825105801.319997-1-lovekeshsolanki00@gmail.com>
 <903f6c28-57f1-4aa2-a111-910fcfbee52b@rowland.harvard.edu>
 <ao2mZdrHdkRTypkU@eggarch>
 <13476f66-13e2-4625-9169-61af0596f6e0@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13476f66-13e2-4625-9169-61af0596f6e0@rowland.harvard.edu>

On Tue, Aug 25, 2026 at 11:40:21AM -0400, Alan Stern wrote:
> But those facts would remain true even if gadgetfs_bind() were to write 
> dev->gadget while holding the lock, wouldn't they?  So the fact that the 
> lock isn't held during the write makes no difference to your patch.
I understand now, I've dropped these irrelavant parts from the commit
message and removed the NULL check in v2. 

Here is the link to v2:
https://lore.kernel.org/all/20260825171343.459630-1-lovekeshsolanki00@gmail.com/T/#u

Regards,
Lovekesh
