Return-Path: <SRS0=87d9=3Z=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823A6C35249
	for <linux-usb@archiver.kernel.org>; Wed,  5 Feb 2020 07:43:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4087620702
	for <linux-usb@archiver.kernel.org>; Wed,  5 Feb 2020 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580888587;
	bh=6w3lhGwPFFCw9s37D8EAb948tFtQbG6EjX54Dorm2Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IjjdgIbUoeWDtEPJ0mOWPAOnAwOEpBAJEQaVWInUKUi2BzDykdXoq1K8tnEzpT9KT
	 5h4WfvUHjgSysDcYnaGIYgs5eim5XUhykV8ApmQFDAYqY+i43LyI6Gk20PoTT2+rRE
	 z0w0JsNjUDFxlNX+BE13n/BovqjW1q4j9VnhPWIg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgBEHnG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 Feb 2020 02:43:06 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:36850 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgBEHnG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 02:43:06 -0500
Received: by mail-lf1-f46.google.com with SMTP id f24so766073lfh.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2020 23:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1Veh1BP7MlVHYB0HaU4g6lxdWhUSA8qnM/6NyfW/IGw=;
        b=df32VxQAk5KL4Wt+uQMaXS7Z9+Hn405rGlAON4aoKb2a1maMsVIzS0WPOSRh6RP4cS
         Jq27DSWh8v7AoSAtfsLKAXTqIjA2/TScGtzrDMaEXi/yPEoMv0c6vbn/p0NvPkB0cBmG
         AnFYoDxkC0w/jQv77ElXSEYm5gG6yktgBkGp0AHxdmcT2L8w8CPPgpzy4MERwATbrQmq
         fK0sW5vTCSCN4aKEq3Y9GhqwzUQxZY2pnVgSmJ+RYH6irytr/0SKv/LmQ9KnHoeDBqGQ
         T8aX5B3tQUMFJUef791b/IlrgYQtSRQG6H9ofqMe/jCzms30/lrQIpVGeZ67g8AnRVnl
         tQWA==
X-Gm-Message-State: APjAAAURUYswhTR9KgZnYZxYpojRDalhj4K13kAJ3wjSYfRrFRqYs6dC
        ngT/Q/hNeWrh3/O5CymABmtm6BvX
X-Google-Smtp-Source: APXvYqw6wpAWksrx9eBJxpAIKPsxQ5+aGl7vkspswgjfHLcW5GITCjQnZom5/VD5qrPTurD0SfTpXg==
X-Received: by 2002:ac2:5282:: with SMTP id q2mr17096773lfm.17.1580888584366;
        Tue, 04 Feb 2020 23:43:04 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id z8sm12637731ljk.13.2020.02.04.23.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 23:43:03 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1izFL6-0007pJ-Ty; Wed, 05 Feb 2020 08:43:12 +0100
Date:   Wed, 5 Feb 2020 08:43:12 +0100
From:   Johan Hovold <johan@kernel.org>
To:     jakub nantl <jn@forever.cz>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ch341 garbage read with 5.5.x kernel
Message-ID: <20200205074312.GP26725@localhost>
References: <b23691c8-9219-b360-6114-93e86a8bd997@forever.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b23691c8-9219-b360-6114-93e86a8bd997@forever.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 04, 2020 at 11:02:04PM +0100, jakub nantl wrote:
> Hi,
> 
> I have arduino nano (ch341) connected to my pc and after upgrading
> kernel to 5.5.x  I am getting garbage instead of text while reading it
> (with both 5.5.1 and 5.5.2 kernels):
> 
> Feb  4 09:24:20 sopa read.pl[2070]: StX.XXA(aurXXXŅstXC#021XX XJXR
> FuX,#027XX#005
> Feb  4 09:24:20 sopa read.pl[2070]: XtX,+XX HXX#026XX go.XXRXXXXXng*Xery
> XXX5XUXiXY'XX4
> Feb  4 09:24:20 sopa read.pl[2070]: XP5逮#013XXteXX11XS4
> Feb  4 09:24:20 sopa read.pl[2070]:
> XP5逮#013XXhuXZ.XX=6SHX#005XAXXXpXKVX}XXt=MXXj
> Feb  4 09:24:20 sopa read.pl[2070]: DXUu X#013X-XXXXXeXNMSX
> Feb  4 09:24:20 sopa read.pl[2070]: XP)}XNXC
> 
> with 5.4.17 I get:
> 
> Feb  4 22:43:10 sopa read.pl[2040]: Started (auriol_last)
> Feb  4 22:43:11 sopa read.pl[2040]: Reporting every 300s
> Feb  4 22:43:11 sopa read.pl[2040]: Uptime: 60
> Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-temp=11.21
> Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-humidity=60
> Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-dewpoint=3.68
> Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-pressure=97136
> Feb  4 22:43:11 sopa read.pl[2040]: DATA_END
> 
> any suggestions?

There were some fixes to the baudrate handling that went into 5.5 that
are likely related to this.

These changes provide more accurate output rates, but I have since
received one report that it may inadvertently have made the device more
sensitive to errors in the input rate. In that case, the reporter
switched to a baudrate that matches his actual rate which was 117647
rather than 115200 (i.e. 2.1% error) and that addressed the problem.

Which baudrate are you using here?

Johan
