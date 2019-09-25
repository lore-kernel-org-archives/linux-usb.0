Return-Path: <SRS0=dvfo=XU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0C9C432C1
	for <linux-usb@archiver.kernel.org>; Wed, 25 Sep 2019 01:20:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 853F62146E
	for <linux-usb@archiver.kernel.org>; Wed, 25 Sep 2019 01:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uhh9ex7b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392646AbfIYBUV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 24 Sep 2019 21:20:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39571 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390869AbfIYBUU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 21:20:20 -0400
Received: by mail-wm1-f67.google.com with SMTP id v17so2316564wml.4
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2019 18:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UFQQdbiZz4NnFfd5nvMxZGjyNO7R6cjqkB3TGk5COmQ=;
        b=Uhh9ex7bAQY76kIolYJhq7EX44samxHO8EwMXdZ6vbVSX7pOCNZQgs+N99T4175/MN
         Bs2f2ETcA332j0jdxVfU9y2KhJbsrn5y+X6OwIgWOaMzq8ynFSzn1Nc3RkUIsHRSMpjb
         6JZpthSCSvg0WyHBbuKTJQ32ivFukiodzRIXwbaoW3+UvSjd6WidSSfPE1t9gWlNALIl
         BUl7q5r+teiCOOuoa0rgx9aGRsQj6R8xGNePyvOK7rxxSSpoHclO5yylI7SZO1AmxdSn
         glVdHISMKGzYnFzp+XqfkTbER/aRYTvzG7y4B+fSNMDUpwnl5q7JJWBXS4aJnXZ/ndNg
         bkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UFQQdbiZz4NnFfd5nvMxZGjyNO7R6cjqkB3TGk5COmQ=;
        b=KVzfV68SfqmhfVuGvF+q9P1DWmcdMjRbEQSux0+LYR0jVwBfiG6HVOYhRPolFQAcRe
         VANQNHcrtSyjwf1rvFp8NHc7UDgNOvm9ZvFbkOXJgKAloQJl0TZakZXpRQ79HBwq3JTb
         3qyprrDFeG1wegWNpLYwRqquOnzulwUQfs2EsycChASLvhca7A0oaxGM3tf6PvAC+dCW
         HDQuFklzpHlbXNbNxx6Rk4zlsK/RZRmijZ2o3nDk4/YOPdfR+7A5S3qZFF1us3U33S50
         9iog8+rxlkJyIXNncHiep7py2oLH4Ieskf/wzKGaNJEgtKF36sVpCgrbUhC0vc6x/mQw
         R60Q==
X-Gm-Message-State: APjAAAVIpAvMO+Nbvkvbu4omNaG6cVLhXd6MML8kVXBRi48Pp3wiJrQP
        tA0k+8+0DtWbNlzS6lVJeF6+AIMuSh7EttfA34AOrKdS6Lg=
X-Google-Smtp-Source: APXvYqwOQRaXZeKEAlIdmurCoxmy2ruKnVBF9Vp19T/woOhemHaXZtEaXpzDZ4WFpm8ZXsiZ7dExUf8gbj+ahw8WAbE=
X-Received: by 2002:a05:600c:254f:: with SMTP id e15mr3900904wma.163.1569374418561;
 Tue, 24 Sep 2019 18:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost> <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost> <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
 <20190923102440.GA30545@localhost> <CAAZvQQ6MPrsfTcsnyD4DbKDVJf1WyLoxqW7q07k2RO1Cs5yd5Q@mail.gmail.com>
 <20190923130804.GC30545@localhost>
In-Reply-To: <20190923130804.GC30545@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Wed, 25 Sep 2019 09:20:07 +0800
Message-ID: <CAAZvQQ51rCF6PqZWU22fkwfgUimsnyCMtC0mb3YRSikm0z=W7A@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B49=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Yes, the above looks good.
>

Thank you for your reply

I have already written a new patch[v8] file,
if you have free time. Please check as soon as possible...thanks!

Charles.
