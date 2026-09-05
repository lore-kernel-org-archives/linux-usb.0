Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABB736215D
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 20:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788640648; cv=none; b=DrC51hBHZ5wLk0GKibkWNtMOKdjV4Az9XaGhySCQLDxE04G8JqRbWEM2ot6JpHzxRgQfKqlZvucV6OY+96iygMmQ6juPZrJolXNfqGr2UsE4iH4ffRFpsTvtC+z6I7w+xHgV6moK8FzBclliG96jE4ujl0kEpdxySugOYaL0TWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788640648; c=relaxed/simple;
	bh=iWlsvFM6Rr0ae7qsAKmVctuZMjVKzVofAfhF3jQzL/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UM6dSvB0+W6QH+PE0jZA8XitXQdxhpVHE0WmDRgcmroHG+gWCAvhTufwLGGMqC6dILW7lD2gDMX2XZf1f1h1dIkAUUCvAV9uwJMbwNGFbbQfyplTNZoKzkQQheLNk8ONhEARKoGVSDEgLx9lts9L6lWboaP9sVDPXxHp7jIMi4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j/LlI37d; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j/LlI37d"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9399997417aso49112385a.2
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788640646; x=1789245446; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/HCuhOF4iO2qHdtVYTW8YlCWS1Wr61bcdCQTIdXIno=;
        b=j/LlI37d/k0F3NBlciuHC9WW1EN4sz3300pVTyY9uES2SHL0vmaABSgSpTzHsH91as
         s2EVa1wLyQSmgtIYvHufx8ehZZU4qgG1RQNXt/f6uYkbse/YiPhtVKV1eVjgKHX9o7MF
         EtqY9eyCliHX9kFMbv8bAn3mbse3To6Xp2QUT6TzXXbFGQB9iWEgZy14DpnIFFlwqngh
         ejR+SJLTWwKOseVBnCO0/wphzOjpkp/oHlDW6onX++jXCScaMRVGVCnBEGNm52KwlhYo
         NtPTP6b5a/eM4GWREddnFeOXkH4w4CnGoPRYUA0Pu1781JEN4egKhixYcd5Yx7MvRORF
         fhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788640646; x=1789245446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e/HCuhOF4iO2qHdtVYTW8YlCWS1Wr61bcdCQTIdXIno=;
        b=njTTUQ9TBaiFFMc2dtXCaDKH234J9xgbcm4Zozf2D4KftRjrvaPM7NXsyDiDCegYA1
         lrcqClXnbVrFCQuGLOOEYXxArvLzrc/BNR0+wz7p2GAF0vKfjJvjFEs3icjG+u2nGWyi
         loh685PvYp6Sh5io49u00uIqb0aG0LkhIS9VNbWr1ySqwZVtNYWW4EPKMe5lN35mV5OU
         eJdRxeALTjsgT/383ox82QzALAbM6T5NYcbeRlpOiFDZBVa2cLjRyyk1qL0Nf6jDOd4O
         LOIqhFehgGP8VE+m6n32nl5Q1d+AkXYKBBBw6iwNQpjHjLd1raiukwM6D2qcdNdjzQJT
         EaFg==
X-Forwarded-Encrypted: i=1; AKwUvByHE4cySlwbn/9fyw6AX93mJ2aWMiAg7wCh2YpwdQu4aCJHzBSvKryX74uK0NCyAYXMxGzLM6IERB4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXsJkALSu/bb9TsPf+gadcFFGeXjeplYIfMqZ6UW5i+NisW2WY
	US0iLS7lrmIPMUZKFwE3ZdUdHlx5LAiYEImznwBBBDVg/ljye14v+5nQ9szpJ5cJCPwVRAysh6H
	T7LcQNQ==
X-Gm-Gg: AYBFou3OetEDQC7nZr0A+gqJZ+xRcohzxAdrJp1+WlToFHnBx3+r00rZWwfqFR18iRg
	2/fvGr+I3Tv6KfoQQ3XdYYf8PQyF1KdBkr6WllMsoujCOghmX5vEZfUqi0RrpUix5JhNgXfnoMm
	9fUuAxPQU0QAG9JKkDIUpFfYfAZsMW4+HRGTg69etquu/GZ9DqGeplNKZPwH6euu48aZtiEYROK
	n1TQwIeMpEF9CfW6wRWif/bsMV7RH+DvwKIYkcszIqFVoGJAAJlWW6gqItKt4X9aTDhCK83pht2
	XSqoxUG6vyvW9CXHmhIFfLzT2PffqzNZRasmn92oCjA5zltBeNDQl9sBMASZ0vkA9hex04Z8I7n
	Bx4c5ca4SbSeLqft0STSnadVhpC2x4atGfEfAbhXDkToivIl5Hzi2867b5SLK0W5tlM9LAKEBEk
	uvTuxoiYkMCzSBNxImM7rWGR00rvnw9uwJx8BaW0SLlA8YoYh/aS7i4iR82xNTZw==
X-Received: by 2002:a05:620a:880b:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9398033d269mr1486479685a.15.1788640646298;
        Sat, 05 Sep 2026 13:37:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb59c72sm505851685a.26.2026.09.05.13.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:37:25 -0700 (PDT)
Date: Sat, 5 Sep 2026 16:37:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Adriano =?iso-8859-1?Q?C=F3rdova?= <adrianox@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/1] usb: gadget: inode: fix use-after-free of struct
 ep_data
Message-ID: <ab9443e2-a2ae-4b24-bb63-eb1e61866218@rowland.harvard.edu>
References: <20260904163827.216389-1-adrianox@gmail.com>
 <0738d3db-3861-4eb5-9847-bde865a1bb28@rowland.harvard.edu>
 <CAMGU2hUOyoWAG-HVCvchqqc4R4uQ7QHaJ_GKGK+hUWw-=Z2deQ@mail.gmail.com>
 <c97a6204-5e6b-4306-a4f9-86b41c268dd1@rowland.harvard.edu>
 <CAMGU2hVGz9PwXhi+j3z0Zn0keUPt6Y9ArU38tpSRYw5ZHupDZQ@mail.gmail.com>
 <52df9295-9989-4a17-86ce-b3827f72ed30@rowland.harvard.edu>
 <CAMGU2hW2cSZuzm97h6f3DcZAzH=1EY0WVBKC+ObsamMJEkAvWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMGU2hW2cSZuzm97h6f3DcZAzH=1EY0WVBKC+ObsamMJEkAvWw@mail.gmail.com>

On Sat, Sep 05, 2026 at 03:40:32PM -0400, Adriano Córdova wrote:
> I think the main CHIP has a dev_data instead of ep_data
>  and it belongs to the mount.

Sure, but that doesn't answer the question.  Is it subject to a similar 
problem caused by a similar race?

Alan Stern
