Return-Path: <SRS0=Pd3P=TD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE6FC43219
	for <linux-usb@archiver.kernel.org>; Fri,  3 May 2019 15:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E53F52081C
	for <linux-usb@archiver.kernel.org>; Fri,  3 May 2019 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556898382;
	bh=E6xFsKNh+F43P8h9h9soC+UY1m9h+x74ZlTS4P9bBOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TRCifj2NxAHjBZN0EcCrTcdKPCjRK42MoZ40LTI+T3MAIENvTeCEZddZd42a0KCuk
	 azQrKyHAjgi87aIp5PuiruGpvDg973qkkcy1UQ3Y/uMtJ5rB6N5jxu6WXNUhoXik4K
	 9bF6uOCgzwhR4jDCeBw3P8oT+m5SzMA5CJfBb89k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfECPqV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 May 2019 11:46:21 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39872 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfECPqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 11:46:21 -0400
Received: by mail-lf1-f65.google.com with SMTP id d12so4735663lfk.6
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 08:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WUeIjNK93DHvSH2Xi8gYGw2v16luFx81rbCNVjUWoeA=;
        b=nIMrLcR30sGDnHGeos8R9fb1Q5oNywUzNgQOB9zzYkN/XKMcUMqAjLbK3oEU70xzOb
         imwPNO4I0oy4OH4obc2iZQgKPXR1rpbRnWMKLK+N6ALlksc4fqxa2vfVZM6c821JlMrs
         DlK43/75dMX5jYpEO2OPecyw2pB1kCgVorXy21Slok76iPtV6FflrkYzNQI3DRlkEesX
         FW6hZQCxpkTsNIAK/QNEF3wHOaxDZFUtC1/4I9MIATFpivgKSzFj79mCSchMfLIzYcqx
         srqaA3EzEHEC87V2mGqbGvVo5Px0qvfcB8+OwBd+FbmCN54veQNS6OQ0zjJOzMUgGlME
         e6Sg==
X-Gm-Message-State: APjAAAXrOdeSiBA/nigBefc5f35fD1MPnGD7/6Sth7+ozTmnuJYiS/sj
        pBE4hKHa7thLnwJd99oq0/w=
X-Google-Smtp-Source: APXvYqwF6lSA2WHbzgdfjGUxu5ms3rFEXOYrNQnN2/SY7B3KVI9mnvU99QgBgeN7p4UxO+LLhlvexQ==
X-Received: by 2002:a19:e01b:: with SMTP id x27mr5372724lfg.14.1556898379564;
        Fri, 03 May 2019 08:46:19 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id d22sm482915lfc.80.2019.05.03.08.46.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 08:46:18 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hMaOL-0001iC-OX; Fri, 03 May 2019 17:46:30 +0200
Date:   Fri, 3 May 2019 17:46:29 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: io_edgeport: fix up switch fall-through
 comments
Message-ID: <20190503154629.GC11171@localhost>
References: <20190502173515.GA13801@kroah.com>
 <20190503060908.GY26546@localhost>
 <31a4c7d8-48f0-9da4-8153-28b58ccc2662@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <31a4c7d8-48f0-9da4-8153-28b58ccc2662@embeddedor.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190503154629.2qhXFtGmVZAqSPJnAM_hzz9AA4cBU8Qtr-ZkDm33Iqw@z>

On Fri, May 03, 2019 at 09:00:44AM -0500, Gustavo A. R. Silva wrote:
> On 5/3/19 1:09 AM, Johan Hovold wrote:

> > Gustavo, how many of these warnings are there left in the kernel now
> > that the last one in USB is gone? :)
> > 
> 
> Today, we woke up with 37 of these warnings left in linux-next. :)
> 
> There were more than 2000 when I first started auditing them.

Nice work! Hope the remaining ones aren't all super tricky to address.

Johan
