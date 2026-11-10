Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278310;
	b=xXTYphrsNpCD46TSSLebBYKkShoi1r3v5NZYzTjLuZcGjS4sqqKIT7fJvI+CTgMqJjP7
	 5O4fPENTPRPfvtSH/bpmkZgoMP00I7qoVQ+zW47TO4exMi8bxvdiIkKbRGmtKSU1l2zcw
	 pBkkLbDv9Kf652XXxhin6Lk5igxv+ul+obO9MwRy+474Tli3pro2qKkC0BKui0U2ygOj6
	 W1w/bpEbT8g/TkZx7ZOHHEebdTzGjRJT5iwuogkcxMRA5s2CGXT1+fUb4rkoM4FAep+Vs
	 g6wF8vnA5/HV6gH/1yZ4BoZCrpQ/1v/dLOOX3wAleXk2KY1MHKvoGOhg32nlavKstEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=stltSYmpgFlH5VfX8J5Rh+P03iEP/0vSu7qCZdvfsXg=;
	b=M75bbuE6Gja4eG/rzTLVzJNpwiBn3W5tdk4xAubxq0jYI35M3wkXRj6QaM66Q6VUbk9h
	 spPrcNg6bQR9T9DWQ5D7Knh/NM4N1FiNZpserilpComybpbZXIw4v0IANWo2+p5BFGhwQ
	 gY0QQL/Z1228CiZBo7DaqvQ7KdmMUsuepeCcinwOGFeuGtV46eUBBv69Cl0XsrM9Dh5W5
	 xWuxRFTWWnGta+W24/AlIwsf/zKth0mXE+O0TmfAr/tRdIo+2gFuZkFHd8Drh7FV74UTG
	 biOvUIYo5voUyf661PVYAtTH/uHIQcmOCCaVhD/Ql27MpM9Om8OL9Id4qccbu2lHCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nOaaIMre;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1B2ZIQa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90755606A335
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90755606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nOaaIMre;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1B2ZIQa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0iuZ3887633
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stltSYmpgFlH5VfX8J5Rh+P03iEP/0vSu7qCZdvfsXg=; b=nOaaIMreXenSktBX
	OcSYBfgGTOFWuyw8kdsaqXkNibG3utUUSeaHp0rh05Mk5m+ss1qJqkNoTqpDtnSM
	sYbzYXQW1irRRoNNJPxT5b3Zhx/KhL7NsZefVZFqHpV+/6nC9bok3fxIYn7K4jzy
	94qPDtHmSg99DcV2JjyzT6PXOoQRYmdtXdRorvvvOLXRzY0R3LyX9sKM4sj/voms
	eKThNnvpxwaTaucO6Sj6dhQrqWn9ZHpJ/6f7HxSO2V/gH8OtIyc+I18r8I79+HCp
	FO5A0SNvQysTzyElkbzig7UKK8gylpCNPCeCXhTw4ppb1JpgTgpkqzZ8zimDN5UI
	3IikpA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjb1tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:23 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so2378645c88.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 18:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794278303; x=1794883103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stltSYmpgFlH5VfX8J5Rh+P03iEP/0vSu7qCZdvfsXg=;
        b=K1B2ZIQaYWcuxU7VWgZhhXXKH0ilkcxvBwG/RlVOhWcYNTt+cFPFaQfRJZbrQXBcwo
         D/LBLbHnv5iNK+Ru4GNjAumk2X7zGU8FAXUU+uJLCDysf/1Xmf+RnU1J18dGhfU/SI7L
         5il4+ApjMG/JWU2toM7yMKTRYgpPjT98+/qDuE8d7iM628T5/0xAp0QP2RSixG4vBYyt
         +KN6VR145N4oeZQtynt5z3U3dHMmXXIr+O+58E9nVw6R4LNDiNP+WCT6K5GzAohMZU/u
         9fApDAomnoMtsma9q0SDmg6gpzfru3zWfHFvf6cTgEdeXuYOgY2EUE+oaP7y901tw8Uf
         Pxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278303; x=1794883103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stltSYmpgFlH5VfX8J5Rh+P03iEP/0vSu7qCZdvfsXg=;
        b=W6gS4DqG5ngBxQwJtghGAW9Z8HEHIyZ4Dyq/3p6qyPPdR/0OndBOzJf80I0QAYkPpL
         iJ8oRZlkF78EsryX3i0beeIbvmHDrYeVM7biKQHCb5mcaOaN3P/OYuark729g2elgKWF
         jVCZgz2VV/WEHyfUfh9AKXKZxEVGH1uzHZGuQq8U7mxSGusB+4LqTb+1Ul2Y3wlQ3IkI
         74ILJp+IOa+d0iajQ4c8GAeEm3+Z4g2zNBciD6wcWykto8g9+2BpmKjgFrJGfXVzDN5R
         Z+U4gLrvoeXNxTw1w9Z+3b9exGOBEgZO2/H5vKO5+hthn59AMQL5Yh97DaL/FQms/+wt
         DtlA==
X-Gm-Message-State: APuU4Z8DRfLBWbC9BBGivERwrbscx3ULYijkeG5g49/V1Djanck4OMhn
	M7sORNgoS15rZ7PlRFsjN6y5icL65dg11ES+ZV7E//yyvUYek8fSyofPWokGVEH55G+Vkw3UYL4
	/SJLhwEFo8oBBN4jqj2Dw0iT4Kv8qiMIk/dIDNDJjmGztpckqvTmiOzzrQ0NToa4=
X-Gm-Gg: AYBFou1WiV800u9oPWuQz3mDnKilvV9O4Rnmk1JFjA+oxTs6nbYEXghK1UnIfp6UgCb
	EnvcMTc+CIpI7iPwoLzMiDr4vWZAXOmJwGpEpxfkgaPW+HX9EKxYiC9dR2neBtm+Be0ObSBZtvW
	2H9HbbCyCHZWv7hFMAGY7Lk8LWlDkqlFS4fgZONWlR3XSAlCzzUMFxqMscYKskd/tbW5wfCUoTm
	9+/YuqdafOU+w54vFWWR/k+5OEfFRyOiGexsFj9Hmmp4m2gP6TiZmNiAb1LYliN+MNIpAG6Nf3k
	xYuvLsEvSnlnKEWbpMnXTLtuQ5WFAhAi7H0oSNX74q6Q71fUeHdSjSedf9NIzP+bwC53CK0ufLj
	2qZjCiBa2UTx/iefNZPCf7jX3LnWdZgh1swKEoh3uEWxwFk+s2P1dBZogE5TN3S89E4+MIHvU9q
	owftoUqa8pu5MJ9XdFj35538R/
X-Received: by 2002:a05:701b:2915:b0:1b2:60b2:96ff with SMTP id a92af1059eb24-1b3b6038482mr1607906c88.38.1794278302787;
        Mon, 09 Nov 2026 18:38:22 -0800 (PST)
X-Received: by 2002:a05:701b:2915:b0:1b2:60b2:96ff with SMTP id a92af1059eb24-1b3b6038482mr1607881c88.38.1794278302138;
        Mon, 09 Nov 2026 18:38:22 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm3800183eec.22.2026.11.09.18.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:38:21 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:38:09 -0800
Subject: [PATCH v6 3/4] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-16k_offload_v1_b4-v6-3-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: ws600BtI1tAXwydmi75BW_LbmdGIdist
X-Proofpoint-ORIG-GUID: ws600BtI1tAXwydmi75BW_LbmdGIdist
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2839f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qIinn66zJS-xtNAvlrIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX7BlKllebzDmc
 zoi6JMTHg330bDyPKdmz30sLeQil51GjIaLENujOtP45brEtyxgY4U4BCAaMsQ9/EEDCwEeiZ8a
 cB9RvXP/JKALLRwgyjIf5cRJ6//eCSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfXz0MDMQn3oxxI
 t7msVSBNqcfh3VkLwW3IIFIsCXmGR1giZZHxJlFYXNvp+Azi7LTCchu/q2irmFv3lX9lGUhGM++
 3eHzBfQLRALrvsmbO1FoUNHUvTkPu25yX3wOMAOhIpRLB/j+Lghhb3clVRo8wyg/X+nC7RNWnn/
 FM8/RILfbMwAg4WP8mKedJVisoyvTsHgko8Un4luHJm8UcJpOGLG7w8KgDcHBiNTVpRlkJEaVri
 jvsRflG6jnQa6vcvC1ECUbAILFGw/wsW2EN+HFNmyR4tivxiGfXvk3ztGUgaRu617UjfEDN/p/f
 w7oMJ6mFJ17tsL0Q4TTGA+LNhtnccsWKydukWYfMnhNPYzDVBU9iUp1lk4cNNIJ9m+4fB3Jix5+
 93EnHer1rDCF095YctvMAqOGUBtNHQjDts07MuVfU1G4avUL5WRN46UFrjazMgFNw1K4jo47Qwj
 cJ4G6HWvOmiXaa+rAJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100010

On kernels with a PAGE_SIZE larger than TRB_SEGMENT_SIZE,
xhci_endpoint_init() allocates the ring segments of endpoints that have
already been tagged via xhci_sideband_add_endpoint() with
dma_alloc_coherent() instead of from the shared xhci->segment_pool, so
the buffer reported to the ADSP over QMI is guaranteed to come from a
page of its own.

xhci_sideband_add_endpoint() must therefore run before the endpoint's
transfer ring is first allocated (i.e. before snd_usb_endpoint_prepare()
triggers xhci_endpoint_init()) for that allocation to apply. Move the
xhci_sideband_add_endpoint() calls out of uaudio_endpoint_setup() and
into enable_audio_stream(), before snd_usb_endpoint_prepare() is called
for the data and sync endpoints, and unwind them on the new error paths.

Now that its only caller tags the endpoint before the ring exists, have
xhci_sideband_add_endpoint() return -EBUSY if the endpoint already has a
transfer ring, so a sideband client that adds the endpoint too late gets
an error instead of a ring that silently came from the shared pool.

At that point in the setup sequence dev->ep_in[]/ep_out[] are not yet
populated, since the endpoint's altsetting has not been activated, so
usb_pipe_endpoint() cannot be used to find the usb_host_endpoint. Add
uaudio_find_host_endpoint(), which resolves it directly from the
interface's altsetting descriptor table instead.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c  |   4 +-
 sound/usb/qcom/qc_audio_offload.c | 158 ++++++++++++++++++++++++++++----------
 2 files changed, 119 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a88698b085c7..7c3a2daef5ce 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -151,6 +151,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
  * After an endpoint is added the sideband client can get the endpoint transfer
  * ring buffer by calling xhci_sideband_endpoint_buffer()
  *
+ * The endpoint must be added before its transfer ring is allocated.
+ *
  * Return: 0 on success, negative error otherwise.
  */
 int
@@ -179,7 +181,7 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	 * and let this function add the endpoint and allocate the ring buffer
 	 * with the smallest common DMA mask
 	 */
-	if (sb->eps[ep_index] || ep->sideband)
+	if (sb->eps[ep_index] || ep->sideband || ep->ring || ep->new_ring)
 		return -EBUSY;
 
 	/*
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..c8edc48cb80e 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -941,6 +941,40 @@ static void uaudio_dev_release(struct kref *kref)
 	wake_up(&dev->disconnect_wq);
 }
 
+/**
+ * uaudio_find_host_endpoint() - look up usb_host_endpoint for a snd_usb_endpoint
+ * @subs: usb substream owning the target snd_usb_endpoint
+ * @endpoint: sync or data snd_usb_endpoint to resolve
+ *
+ * usb_pipe_endpoint() resolves via dev->ep_in[]/ep_out[], which are only
+ * populated after usb_set_interface() activates the endpoint's altsetting.
+ * Look the endpoint up directly in that altsetting before preparation instead.
+ *
+ * Return: matching usb_host_endpoint, or NULL if not found.
+ */
+static struct usb_host_endpoint *
+uaudio_find_host_endpoint(struct snd_usb_substream *subs,
+			  struct snd_usb_endpoint *endpoint)
+{
+	struct usb_host_interface *alt;
+	struct usb_interface *iface;
+	int i;
+
+	iface = usb_ifnum_to_if(subs->dev, endpoint->iface);
+	if (!iface)
+		return NULL;
+
+	alt = usb_altnum_to_altsetting(iface, endpoint->altsetting);
+	if (!alt)
+		return NULL;
+
+	for (i = 0; i < alt->desc.bNumEndpoints; i++)
+		if (alt->endpoint[i].desc.bEndpointAddress == endpoint->ep_num)
+			return &alt->endpoint[i];
+
+	return NULL;
+}
+
 /**
  * enable_audio_stream() - enable usb snd endpoints
  * @subs: usb substream
@@ -948,6 +982,7 @@ static void uaudio_dev_release(struct kref *kref)
  * @channels: number of channels
  * @cur_rate: sample rate
  * @datainterval: interval
+ * @card_num: uadev index
  *
  * Opens all USB SND endpoints used for the data interface.  This will increment
  * the USB SND endpoint's opened count.  Requests to keep the interface resumed
@@ -958,8 +993,9 @@ static void uaudio_dev_release(struct kref *kref)
 static int enable_audio_stream(struct snd_usb_substream *subs,
 			       snd_pcm_format_t pcm_format,
 			       unsigned int channels, unsigned int cur_rate,
-			       int datainterval)
+			       int datainterval, unsigned int card_num)
 {
+	struct usb_host_endpoint *data_ep = NULL, *sync_ep = NULL;
 	struct snd_pcm_hw_params params;
 	struct snd_usb_audio *chip;
 	struct snd_interval *i;
@@ -987,42 +1023,75 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 	snd_usb_autoresume(chip);
 
 	ret = snd_usb_hw_params(subs, &params);
-	if (ret < 0)
-		goto put_suspend;
+	if (ret < 0) {
+		snd_usb_autosuspend(chip);
+		return ret;
+	}
+
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0) {
+		ret = pm.err;
+		goto detach_ep;
+	}
+
+	data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint);
+	if (!data_ep) {
+		dev_err(&subs->dev->dev, "data ep # %d not found\n",
+			subs->data_endpoint->ep_num);
+		ret = -ENODEV;
+		goto detach_ep;
+	}
+
+	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, data_ep);
+	if (ret < 0) {
+		dev_err(&subs->dev->dev,
+			"failed to add data ep to sideband: %d\n", ret);
+		goto detach_ep;
+	}
 
-	if (!atomic_read(&chip->shutdown)) {
-		CLASS(snd_usb_lock, pm)(chip);
-		if (pm.err < 0) {
-			ret = pm.err;
-			goto detach_ep;
+	if (subs->sync_endpoint) {
+		sync_ep = uaudio_find_host_endpoint(subs, subs->sync_endpoint);
+		if (!sync_ep) {
+			dev_err(&subs->dev->dev, "sync ep # %d not found\n",
+				subs->sync_endpoint->ep_num);
+			ret = -ENODEV;
+			goto remove_data_ep;
 		}
 
-		if (subs->sync_endpoint) {
-			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
-			if (ret < 0)
-				goto detach_ep;
+		ret = xhci_sideband_add_endpoint(uadev[card_num].sb, sync_ep);
+		if (ret < 0) {
+			dev_err(&subs->dev->dev,
+				"failed to add sync ep to sideband: %d\n", ret);
+			goto remove_data_ep;
 		}
 
-		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
+		ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 		if (ret < 0)
-			goto detach_ep;
-
-		dev_dbg(uaudio_qdev->data->dev,
-			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
-			subs->direction ? "capture" : "playback",
-			subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
-			(1 << subs->cur_audiofmt->datainterval) *
-			(subs->dev->speed >= USB_SPEED_HIGH ?
-			BUS_INTERVAL_HIGHSPEED_AND_ABOVE :
-			BUS_INTERVAL_FULL_SPEED));
+			goto remove_sync_ep;
 	}
 
+	ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
+	if (ret < 0)
+		goto remove_sync_ep;
+
+	dev_dbg(uaudio_qdev->data->dev,
+		"selected %s iface:%d altsetting:%d datainterval:%dus\n",
+		subs->direction ? "capture" : "playback",
+		subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
+		(1 << subs->cur_audiofmt->datainterval) *
+		(subs->dev->speed >= USB_SPEED_HIGH ?
+		BUS_INTERVAL_HIGHSPEED_AND_ABOVE :
+		BUS_INTERVAL_FULL_SPEED));
+
 	return 0;
 
+remove_sync_ep:
+	if (sync_ep)
+		xhci_sideband_remove_endpoint(uadev[card_num].sb, sync_ep);
+remove_data_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, data_ep);
 detach_ep:
 	snd_usb_hw_free(subs);
-
-put_suspend:
 	snd_usb_autosuspend(chip);
 
 	return ret;
@@ -1140,20 +1209,12 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
 
-	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
-	if (ret < 0) {
-		dev_err(&subs->dev->dev,
-			"failed to add data ep to sec intr: %d\n", ret);
-		ret = -ENODEV;
-		goto exit;
-	}
-
 	sgt = xhci_sideband_get_endpoint_buffer(uadev[card_num].sb, ep);
 	if (!sgt) {
 		dev_err(&subs->dev->dev,
 			"failed to get data ep ring address: %d\n", ret);
 		ret = -ENODEV;
-		goto remove_ep;
+		goto exit;
 	}
 
 	pg = sg_page(sgt->sgl);
@@ -1177,8 +1238,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 clear_pa:
 	mem_info->dma = 0;
-remove_ep:
-	xhci_sideband_remove_endpoint(uadev[card_num].sb, ep);
 exit:
 	return ret;
 }
@@ -1519,14 +1578,10 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 		uaudio_iommu_unmap(MEM_XFER_RING,
 				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
 				   PAGE_SIZE, PAGE_SIZE);
-		xhci_sideband_remove_endpoint(uadev[card_num].sb,
-			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
 	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
 			   PAGE_SIZE, PAGE_SIZE);
-	xhci_sideband_remove_endpoint(uadev[card_num].sb,
-			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));
 
 	return ret;
 }
@@ -1637,11 +1692,30 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
+					  datainterval, pcm_card_num);
 
-		if (!ret)
+		if (!ret) {
 			ret = prepare_qmi_response(subs, req_msg, &resp,
 						   info_idx);
+			if (ret < 0) {
+				struct xhci_sideband *sb = uadev[pcm_card_num].sb;
+
+				if (subs->sync_endpoint) {
+					ep = usb_pipe_endpoint(subs->dev,
+							       subs->sync_endpoint->pipe);
+					if (ep)
+						xhci_sideband_remove_endpoint(sb, ep);
+				}
+
+				ep = usb_pipe_endpoint(subs->dev,
+						       subs->data_endpoint->pipe);
+				if (ep)
+					xhci_sideband_remove_endpoint(sb, ep);
+
+				disable_audio_stream(subs);
+			}
+		}
+
 		if (ret < 0) {
 			guard(mutex)(&chip->mutex);
 			subs->opened = 0;

-- 
2.43.0

