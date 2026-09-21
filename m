Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2A282F20
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789954969; cv=none; b=j/cOLqv4Wg0glVrfO7sRgcpI09fRmx9RJMnPDGL5Y072BlnBGb6XJlFp3norUX5g5eTE34HzR0iRSweNinlryqApkQDN3I+mLRgGsylaaqGteXBKWDJp/KrEHsiONpUlENvxlmYcbAG4aBstbQz2Kmx8hFEak+Oc4rOzeMSz7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789954969; c=relaxed/simple;
	bh=DWVt9+tgRutO33g/JPjgaS+vnsJ1FuBmWnYngZFepIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5rnQwwK1FQCQmupXH9fVZkEsJgo3ANtaevnMvVcVYLgAbDHftI8wTrW5mYEvDnANthNnGDfH5+5oSBVrH/6R2jLcJyqOQuAyLpfEb6rsii0k9exdUHDWiTMXCdYwMb5KGJz0WQKao6SxHFYy8LPoS0AnWacWsQcnsQ7iO5E+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9+8swQU; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9+8swQU"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so1678377a12.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 18:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789954967; x=1790559767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAwJLJRI1juBA2aagV/5DfGdvOb77xC4nzYYwed9V5Y=;
        b=d9+8swQUIFIpfmYVbnP+toi02K2s1PwaiqiRw78GgUukq0+5ZxKN2ZDr7pg/+eGtkT
         rIxyRyASX+ji7wmrjHGe7UTS6Owzn1x5pH71QLk6z2b2wyCFsKHhp2N60BmXuOEUjpTn
         HCNb4Is6DTlVycscY+idq5nkbPzyxDc/vHbBiL4tzq3QM0dYZ6/e60eQfeF5kyD9voc9
         oUFgN20kw/GDdvZGzdLXCgeszRuIYBX2EhMukBmTLsWfHeEX8qGUYFMaBb5w8NYtJocp
         NZqbi8lGG4ELlsKowFp6g31IohUtUeBrt4bOzEnGLoJ8SxPEJrQkp8YclQJcl+lgPkZ0
         BK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789954967; x=1790559767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAwJLJRI1juBA2aagV/5DfGdvOb77xC4nzYYwed9V5Y=;
        b=joSO8aA4yh/SwstDzGvPDvzkJ5A94wWGWJJAdur0r9yxZv/nopg4GazJnPSbgh2mR7
         YVJm009FQo8rchASV/b10jtmFxL14ea02SbhCCQ3+1IqmqpuF7mG8waGOjtC6CACY7T1
         ojVNlckWGGfLOaBTivkqlCbrtSTI+arxMRd3Zv6rDSR2eUeOHvRIJscqWkWPM85anGw6
         WGaF5X5S1kCH33AFUWjwRl1+fNMG3ADKw0W3FDtn9c6urt8VVi0CDWb8h0iT8eu1ssCT
         iPM5cTJKEcp3YXlBnhzA37gbqRwowHH1yo65xyKXXw1mT9BTiWla7CvJhkJO+w4iTEjw
         Ow0g==
X-Forwarded-Encrypted: i=1; AKwUvBwco/W6+5UvuSQoYGZushkSCmDjnFogJnOsIFw62GnRJbf0t4khyKNlMKEpKXy79HiqtRbv3ZANhDA=@vger.kernel.org
X-Gm-Message-State: AFuF++mlbl0McCSGiOaWELWq7GIwUmpe0WS9rDHpkMhWhghQ4BOuThAr
	tF7L6aWmG/puGwdRAxovWjFtGhrKY+UGK2kox8PLPimLMqsk1ZGlQA+l
X-Gm-Gg: AYBFou2O5xeD9aLpPPglBmbNZvbGS/2kvam9pkO5Uado0J6y3kI5zn9ZQKFrHDIsjBf
	+BDPOKJXF8b4bKL4ma4a+19fsoTAyDskFwm0lVChDxJ58NSLQi5t0tM1R8N6aCdX4VdHf28Xq+8
	8koidYimZOmwYM987m5nGliioT8jyaSexyPAyfqqfB+QtY0GN4dZ+MWEbg+5A14EDKwNEg6yPst
	QP+idozV+sWu2N3+h4SnlvDk3pdoOI7I7wruSVSfh3AAyXnUOnkwhKXcjz8m55+sMTvfJQ3yMrt
	qPKA+9gW0xeUBennzXXWfhivbCc34MYR967neoFmVaARmbMVwJD2+JUuNQ4lqsOKMHFYwS6rYzL
	+eLps3L4REhQE7zvVpidJzCVsViNRIP0RSyMbvj6yDHhs/tW4WhGX76sHvZRHb1WKX5JVZQZmlh
	hF8lGFFqwXNZsSeWpX0UwBc8ctuWZ5fGvMsaUHD9RkpXEH+mng3qqHv6+jT8lLDF+TBZti5sri/
	faFQYnKz76eglx/OiX/xHT7hBxW8r0KNcadCr2wIdS1wieQjRftLKYy0eArHE+HQTrdbWebLaD3
	4rb/BYhnXA==
X-Received: by 2002:a17:90b:6c5:b0:3a0:295e:6e58 with SMTP id 98e67ed59e1d1-3a0295e7719mr5642329a91.2.1789954967119;
        Sun, 20 Sep 2026 18:42:47 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cabafbasm11468127a91.10.2026.09.20.18.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:42:46 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hui Peng <benquike@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: clear both ep_in and ep_out for non-ep0 control endpoints
Date: Mon, 21 Sep 2026 01:42:44 +0000
Message-ID: <20260921014244.711023-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <fea9a6f7-b6d1-4b20-968d-a306ee4b4e80@rowland.harvard.edu>
References: <20260919223518.3890208-1-benquike@gmail.com> <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu> <20260920231702.110963-1-benquike@gmail.com> <fea9a6f7-b6d1-4b20-968d-a306ee4b4e80@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 20, 2026 at 8:21 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> You might consider looking through other parts of the code to see if
> they need similar attention.  Historically we haven't been very good
> about supporting control endpoints other than ep0.
>
> Alan Stern

Thank you for the review and Acked-by, Alan.

We will audit the rest of the USB core and host controller paths for
non-ep0 control endpoint handling, and if we find any additional issues,
we will report and submit them in separate patches.

Best regards,
Hui Peng
