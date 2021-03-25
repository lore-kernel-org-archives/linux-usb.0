Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8372BC433DB
	for <linux-usb@archiver.kernel.org>; Thu, 25 Mar 2021 17:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5646F61A2A
	for <linux-usb@archiver.kernel.org>; Thu, 25 Mar 2021 17:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhCYRsS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Mar 2021 13:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCYRrt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 13:47:49 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A576C06174A;
        Thu, 25 Mar 2021 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=u/bexe4Djp4doWgJwtQivZm3RyzQYaYzdeQh59a8McU=; b=PllTquKaOuR/IHe2MwmUbZMvd2
        ymlM5JPIfHRVFwmeG5MNRKciFMnbbvoYdLU0JngJefz8LDPsiE98kBNd4uCtAZSbbo8Q0HF/Ba5BQ
        3jnQTq0Vys8Mxk9RXbxM9KeBsCdmlNVCrECjZVWPGvJFoIe4SswKMSdi/eeRTpu36AD2fG5ErFeAA
        wf4AG9Kd0x4W+U0wk083iBXrfM2K77TU+x8dqqTxUru+BhdfvShtl6DcUm9Oa5thzXbcJ2RAIuffJ
        spNOS/FnK6g/UdjzvyHJcXbKVfPli3qbIKU1l6B2njDYn0rf8VIMQtPXlqT+TGR1FqCPgUyysx1gk
        i/wP8Zfg==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lPU4v-00DS2h-LQ; Thu, 25 Mar 2021 17:47:35 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2] tools: usbip: list.h: fix kernel-doc for list_del()
Date:   Thu, 25 Mar 2021 10:47:24 -0700
Message-Id: <20210325174724.14447-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In list.h, the kernel-doc for list_del() should be immediately
preceding the implementation and not separated from it by
another function implementation.

Eliminates this kernel-doc error:
list.h:1: warning: 'list_del' not found

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
---
v2: add Acked-by Shuah; send to Greg for merging.

 tools/usb/usbip/libsrc/list.h |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- linux-next-20210323.orig/tools/usb/usbip/libsrc/list.h
+++ linux-next-20210323/tools/usb/usbip/libsrc/list.h
@@ -77,17 +77,17 @@ static inline void __list_del(struct lis
 #define LIST_POISON1  ((void *) 0x00100100 + POISON_POINTER_DELTA)
 #define LIST_POISON2  ((void *) 0x00200200 + POISON_POINTER_DELTA)
 
+static inline void __list_del_entry(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+}
+
 /**
  * list_del - deletes entry from list.
  * @entry: the element to delete from the list.
  * Note: list_empty() on entry does not return true after this, the entry is
  * in an undefined state.
  */
-static inline void __list_del_entry(struct list_head *entry)
-{
-	__list_del(entry->prev, entry->next);
-}
-
 static inline void list_del(struct list_head *entry)
 {
 	__list_del(entry->prev, entry->next);
