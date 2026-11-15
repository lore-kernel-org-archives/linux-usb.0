Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757978;
	b=F9KPrdNJhLPfFbHQq/OZdjxVdlSxuIJ5LyhAQBRwmflyYDG9wuRrYCMknDYAHVR2JGt9
	 C/TPUn55kztKavvjxPnXb+LN4WcBjLw8V43RRL0ibLiz9iPp+VvNCvCmaYrVjeXBJBNo3
	 IoQdj138IUYOM6G0SNxpf6uH2cbiLDbAWPZ/7Kk1MP+cTlcc6nCAqX74J/X/8YHQRNSY1
	 B2Zpqa8zZzLkllSPgzWkXWOBSX1RSkSDkvYFBE7vuxzC47za7Ja7wfu/PImAu2IICvIYQ
	 6e9Bsf47/tDcNss9YO7cGyfU71gHKEGpoqZM9fWZCQizgb28KsjT9jBzWn8w7jGmfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=zYLg9CDhxj90tCxncwjOVnCz5bkJHfzwDw5ixcwSYAY=;
	b=2Oyx7wElB/KVDhhybBxFBJKgfj87oSM13sR4CYMyQqASFncuWwF57DQnBgl7WyZrpw5t
	 ryXycAfLCoLo+iOj4/CwY3zlhYyPg3Xzm5EEFS7otIzmVaZ7WCGYeZbn2zwQwKH4EmRiG
	 wp/JXmR3ZYKDZEEZeWM9sYKd2NzDoktztDUqorXwe0bXXAjoBrVYRbaeuzfqFIrdgwDfn
	 p/KIlbGlzwblTHP/jmm6MUIrvsuPCSCBlpbg5pVx2hom91fGeOWFf2sdoe9nAWpQwvAyi
	 P3GfmzMo2IOpPGANI4iyVvNUelIisK/V2gg/v5oXjED+XsS4lCjD9XzxUPHvzFdmE3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=rdlVdlY9;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372F606A327
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 15:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D372F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=rdlVdlY9
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-94962d80d34so78821885a.2
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 07:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794757977; x=1795362777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYLg9CDhxj90tCxncwjOVnCz5bkJHfzwDw5ixcwSYAY=;
        b=rdlVdlY9zP8I5QcooO08a+w2q8HrBN2sNX3xECK2d+eML/sd8Zkn48dk9ZCC/IcWQT
         ER71faOAqY3oRAmrF+dwHSqz2bJtmOiZ1t3IeLlN9U/KJWP2ZUqCFSUtAU4bkZOACKyD
         3/ezPyBoMo2gmXrrMoNCMPaCXieQbH4Zuo26ev7oP4AfbpSwDQnnBsFOqAlhdAVcqDlr
         /WTrhv34lU+FmEcw7nCcr7TmHmTkty47Xq3euFu9M3akOFgdJ9qb1v3zdyiKFdkIAtXe
         ydJN/oR2QjSzMGDJmVcfSTeT2V6jqSA90xz5ZleQ1LMy9ACXbwC9GezebVKpZMYKfK1a
         O/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757977; x=1795362777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zYLg9CDhxj90tCxncwjOVnCz5bkJHfzwDw5ixcwSYAY=;
        b=Oz3DH3Bjb/KPvMH8WAuA9iarNfdfzvxTti93crbe9oWHFIxJ2sDqikQSoUIBLmI4XJ
         p3i18O1X4746v+YSpTBlw6P4hR0ZOApSQ+ISWwnGbcXmCIxxS3l6YS+1dKq3AZQb1bBn
         mlDDRo3MUC+Hu39S90vNcqFAubrnfcQNXxmexZ0qBHrOVxncwtwBXXQqqx2EDjHVe6wG
         +csKChLHJaGBwKW1y1vFr5j663Tmkztwxzr3amlGc8nxEOVqGPrLaFSFKC2aV2McgQKq
         w001UpwFe+uIjP4bFtHfZFzuEBb6uyjWiqeYXqYhnylG11oR9v2Lvc2e4UPX2xR4LHW6
         H5gA==
X-Forwarded-Encrypted: i=1; AL+hErFo7PESY0Wd0dVMDOYmzMYUIjV/9DVqh7FqM1hiPUzOOnbdLB4U77OGP+Lq7nzGlKVLcrowpBIDlx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+EU11At6CC32rx+1T7bV0hyIer7R8m4seq79dIW4Pi1xxr6nL
	mYN8z8nmsG/KnqMHL+dIC/43osbQO/FahH4vHfOxlGE19SF4zg9CEiuX7WtQsvPN1Q==
X-Gm-Gg: AYBFou1MyLWQ8E9xv0UclgnMCpR1gVQ/Eg/sUo9NHaUAu4uImUn1LfmPVTEumt7F08A
	cb3dIH9C1wW49RVNc3m974DhRXF1ZCsM6EPa/SZkeznI8yu+YaiRuWwrqaojQJmxiU8e5jfAYv6
	OUh07QHxzz73YFQYra3CmrMxwuxixA0jCVJtF2Y2k4MLk21yhy6oGGU0e2r8bvK1THHnYliXuT3
	u3f+Bsi1J7OxWA5OpFfWslg8pXA1vsNylJsHy8oz/fDD1sV8BN7XBH7SFtdZl19triA+sPpj2U1
	iBjBzT/f1d/8VQsKwutHySBfTJi1vUPy61E/sTnQ2ThE1gGQdQH2RfjwrDG7PvkNDZk+AzHwUnm
	xOOrbUh4xnRWZ6a5H6x0imimKJvSqE1dc+NylF2cIa7yhiZUNAJhFztL5VM7N7pLdGEVBDd6KLt
	lIw05/PNjFu24eVKJCcF9l7Rn5WZ8QoBq2epLO9DwhnWJpDTjUORhEbGHfWSeN079aBFp5Vtgn8
	DJyYRxUyBSFI5OvpeO/tlu0zmoUU4mX0oyPmHQJ6YQGjS4WikM8kqEZHfkivf8JHmRs6JU/WATh
	sH6aNv8R0D6ZhLyYHuZRnoOEFFCZabg=
X-Received: by 2002:a05:620a:2994:b0:949:7069:3faa with SMTP id af79cd13be357-949706943e3mr449902385a.4.1794757976522;
        Sun, 15 Nov 2026 07:52:56 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db8d26sm66871726d6.43.2026.11.15.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:52:55 -0800 (PST)
Date: Sun, 15 Nov 2026 10:52:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	smartmontools-support@listi.jpberlin.de,
	Christian Franke <Christian.Franke@t-online.de>
Subject: Re: [PATCH] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 deny_ata_passthrough
Message-ID: <1e731b43-93ad-4230-833a-df6949c7d4c6@rowland.harvard.edu>
References: <20261115124046.5286-1-mat.jonczyk@o2.pl>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261115124046.5286-1-mat.jonczyk@o2.pl>

On Sun, Nov 15, 2026 at 01:40:46PM +0100, Mateusz Jończyk wrote:
> The uas driver blocks access to ATA passthrough commands for some
> devices it considers buggy (via the US_FL_NO_ATA_1X flag in
> unusual_uas.h and uas_detect.h). However, it does not expose any
> meaningful information whether the command was blocked by the driver or
> is genuinly not supported by the hardware. This creates a problem for
> the smartmontools program and makes it difficult for it to provide a
> useful error message (with instructions to disable UAS on the drive to
> get SMART readings).
> 
> So, expose the information in sysfs as deny_ata_passthrough. Other
> quirks may be added in the future if there is any demand.
> 
> Link: https://www.smartmontools.org/wiki/SAT-with-UAS-Linux
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

Why was this change made to uas but not to usb-storage?  Was it because 
some devices can handle ATA passthrough commands over the Bulk-Only 
transport but not over the UAS transport?  Note that the 
US_FL_NO_ATA_1X flag applies to both transports.

Alan Stern
