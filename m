Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AF5C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 06:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45ACD206DD
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 06:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556260841;
	bh=fxWPvDCAT7P1mazKn9Z9S7uGm1IRMvdOlq3Az2nkUjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RigE/t2dQPg7FluhwCPZJ2vgALJ0qqd8CV7knyKjBY4rxIDIV2aCG6MVQlqN89cd3
	 hY+ZxlqgoEZO36Xk/quXJKkae4eXP3CXwa1D4cgR1ch8jcuktOPNPmTRWYNa0vW26A
	 ZbxKVRRPCYN/FObqHSghrQf6W3yFk/JGC6pseQQs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfDZGkk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 02:40:40 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35980 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfDZGkk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 02:40:40 -0400
Received: by mail-lf1-f66.google.com with SMTP id u17so1636365lfi.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 23:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HWJlCEWD3Z11GGvYR+OPOoOGko1Un62OsCVEHCgGfac=;
        b=he9VnEqO91XfED2QRWUtS4FfsMkuU09iddLSJ6sJbf6dTlpxuIuFAhTwQZCg4RIR3h
         KMBtP2kRCUGMkbpWJl7+rM7eCQWrlERueleUIbNaC4SK+ablS4Abw3WdmkOSEqAZE8u6
         laUykKfupwjl5PndMpJ915mvIov2mc6PqAXxXUgkuL/83hqyY5+Yj8+Kaz+6IPx+ACdB
         0vTsWPkipS/TbxmWF2TzrmrJ1h4yeVMG1hlNmflIG7mbR38r4SF54O0+P3OFET3ytW6d
         BMNakW0wiePt3NEm5KVjNUYtnFs5ShJ5/fNg/ZnPVae1/SOJmVChWSEy7H0kSeXI+hPU
         DHOg==
X-Gm-Message-State: APjAAAWPTvUTSTS5Ld/a/QsrDs4L9HQcUYNgwZGeha7HQXGrrkNrUTbc
        qir0ihmpsVhd7U7fR3FH1YETie/k
X-Google-Smtp-Source: APXvYqwK+h9ZvzRc/YrHylGvb1MkbjyW4GengaySSd2DP/s0T070xnUVGV0qyI8u2tmQgWsppslICQ==
X-Received: by 2002:ac2:4566:: with SMTP id k6mr23716322lfm.22.1556260838280;
        Thu, 25 Apr 2019 23:40:38 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id h26sm3281798lfm.11.2019.04.25.23.40.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 23:40:37 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hJuXE-00040k-MB; Fri, 26 Apr 2019 08:40:36 +0200
Date:   Fri, 26 Apr 2019 08:40:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/9] USB: serial: fix initial-termios handling
Message-ID: <20190426064036.GD12280@localhost>
References: <20190421122154.26465-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190421122154.26465-1-johan@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 21, 2019 at 02:21:45PM +0200, Johan Hovold wrote:
> A few drivers override the default initial termios settings provided by
> USB serial core, but due to a long-standing bug, the terminal settings
> were being reset on every (first) open rather than on first use after
> probe as intended.
> 
> This series fixes the bug and cleans up the various init_termios
> implementations somewhat.

> Johan Hovold (9):
>   USB: serial: fix initial-termios handling
>   USB: serial: ark3116: drop redundant init_termios
>   USB: serial: cypress_m8: drop unused driver data flag
>   USB: serial: cypress_m8: drop unused termios
>   USB: serial: cypress_m8: clean up initial-termios handling
>   USB: serial: iuu_phoenix: drop bogus initial cflag
>   USB: serial: iuu_phoenix: simplify init_termios
>   USB: serial: oti6858: simplify init_termios
>   USB: serial: spcp8x5: simplify init_termios

I have applied these now.

Johan
