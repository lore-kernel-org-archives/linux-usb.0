Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51488377EBC
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005075; cv=none; b=J8Dqu9FCJ5hgObcL7S+7mZO0ymOO5QlrFdf4fetPX5w5Lyk4GSvgBoLn0mTVGO+mqT+kHcSEb68UB46WqJr0DQsAz90WIyML0F397Pptt8MxDg3dVYJySykfwODXR1/229eR5txFxu8RQIG+ITOGolONGKIbY51WggVL8tJa9q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005075; c=relaxed/simple;
	bh=QiWwIdap7asM25atMCh4cE80kDP0AIHyDVgphgNTl8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tymb1rCiZ5QY2VLAD0SNvWH7Eup/b5E3HQwyrOOTuzQdFDE9vKovqKMhQ2ZOVeE24f8kpb41DlPDoX3aDQzeHwp30BK3R/MKThjTTUkKjJqaTTj9E6ch/Ki0APDILGp9/2mGQsKX719d4TyTspCvtAkclrWCh13nvQbIhfkg+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdThvFpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlmxhEsK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdThvFpO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlmxhEsK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lCoB3029830
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdLMLU0lIE2FaCyPNgoMNNA59jScOU92wfwmF9t9O/A=; b=kdThvFpOM3fx/Fb0
	5Qe7+3TD5LES9iEl+rPlTDXpqKLwp3lUGaDaZHs387YF1ANoEkRLKR6/zQATOClb
	TWL76mwc6fhKYQrjju41TXVPEUlX+YrWt3Mmoun66nJev4c8FoklXYfPuExca+RZ
	A2lE1tY/wjRdee61R/TC5BU5jBGDLrD7qc6bTop1bx1U5flID41jq0LmU3U8MN0y
	rLLewRM9sEbSN5dHBqimCdX7wqckfJtjLxjAhTHtgAaunkwqYNZKR2mkmFbMP99k
	edmCqwoLE6rA0dpKFcsFcj7v7t+S3DXI2eto+WYYP3UEX1oYYMZu97GDoC/66Gh7
	oGqDnA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyehgbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3525215a91.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 18:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005070; x=1789609870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdLMLU0lIE2FaCyPNgoMNNA59jScOU92wfwmF9t9O/A=;
        b=NlmxhEsKHZcMm/yBF2D78p0lVZ9DX0vIl8HAYcPKjuLErUA7ucwneF9oRAHQzUbmEe
         l34S3IxfrSO3g8EB3007YvDkBkAl/T84ahHMvSg2BdQcUMqsg3gUHLbDmt0rfJth++2v
         TckMMr/WjPMzEvrDlI6PzXbQQcLP5Ue6cFFWL10yXTS0boIKYzestHhfqR9lDML5SdKf
         XxEjZa+ivapyyKeKGgW5gZSi5wYUYKuqNaQ4pIUtpmOUhrXOQfA0fGO6hU9tJIwXVW7R
         RGHqe/hr/WH4+rPJ56rNOUbk9jlR4F1JOJUIyH4hkzcZQubeP0acn5zLnolfv4wM7SYE
         zz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005070; x=1789609870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdLMLU0lIE2FaCyPNgoMNNA59jScOU92wfwmF9t9O/A=;
        b=QxMa6VVakWpdvkLQPt6QDuzzNgLjYmAIAJlV6xv5A9E+gv+gQ3+GAhkQ3OvpL3q9ZS
         AXKzQkZgSPBcfr+/0qNuk+/Yfe8lsX9Gf1dLhIFAbVLtFoAj6z7Ucgv2z7GSS/OURog4
         Vs4/vxNxMkOeqEOj2a6Zgq7Q4Vz/VmRnts0vPvN33YkVLT0UVX6FVryXCFuGbwbn9Ghk
         Elc6QP4UppNJ7kYt8GfdRU2rNM9DxkZw44obvIj8SSD4z2lFDtDktrImy1Vew6yxBFCr
         S6dD95o+tWtT/vdj1YvofvrcX9OxLglbVLxZqlRGfQmpXb9+y/v1rP9w/vXQgbx+S0Dz
         DM+Q==
X-Gm-Message-State: AFuF++lkVSH5MKA9wvmpxzOFgE6sITHv7ti11VnqJzTiq/by4yDlEuwi
	LHjLUiuPmElAQwpVjPoeebyJKErxuregc6/si9WHt3eTD+IZaiv5ysuK48+6zFgAKm8/ubQ1/4X
	sMS9USivkjYrfLPXV2hiaH3xnM5fuEaMW8pqmgDNH9XlFJ6JUCbSTarTdIQuVXCxQ6M/rlEg=
X-Gm-Gg: AYBFou1yMAhlLuwKeIxMVM0thETtzmHR7e0KI3mb0RWD0sLILPDR/cCxKPuoEsb7Zt2
	vit8t9/YlZZ/ol+83csx3iI/hTD2oAjm0HODFSnjHTFJdT6ELq6uobb2CNE/WVv2vkxGEPpO8TO
	oTYSv7oGsJ1oXgCMs7wL32AZt7YHMSQrYOIfDp95slSbrQ6ifoDoJQmpVCkI5QegYSuTOz7X3kU
	0hQTtHQ4WN4Lkh7mLdQJtNzCVO7DDu6f+rKmK4fGw90L2GGrZ4h5doyOIvrLlD+J8c1lmKlF4qJ
	d6KO7Xm3x9GzwJwhX4glXmxuCJWUPOEylyYYNXIKZ27IttaUtn+4vW9oPgExJhapOTSxDnbIvXn
	0ZeZgBiwoRhJqeyUKUwuY3mPE0h9fLJwyRMIUatYzuvv5R/3TCTOv
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr55626605a91.23.1789005069607;
        Wed, 09 Sep 2026 18:51:09 -0700 (PDT)
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr55626527a91.23.1789005069086;
        Wed, 09 Sep 2026 18:51:09 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:08 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 18:51:00 -0700
Subject: [PATCH v4 4/5] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-16k_offload_v1_b4-v4-4-f24a86617597@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfXxNsOTHx7lBlG
 fL03QYiLhwH/FwkxCfGeGW5Qnt2aJENA0N7ON+3MaP2pFhpOG2PaI2uOj2OkzN9ybt67aWXD5IJ
 xRa8H0eUj8ZUnoV9bbbpQDXP6pSLq1g=
X-Proofpoint-GUID: kCCoy_jGRQwonGyWMU0619kYIlmh_iMU
X-Proofpoint-ORIG-GUID: kCCoy_jGRQwonGyWMU0619kYIlmh_iMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX3E8tfNFs6D/a
 /8lIXLTkQr+V22bQx+NBPAasO4ODmt/qt+kc1Izp7sgDKooZ69t9CsuxUvkyMkMu610hPokf3yM
 ISUlctkQJVyhwjQQr6FBE4aGYrOV02kdsmSUhV2LgRV4SQCIuPPDT/Cj5M3/WmqmmVNNancXyWV
 Ojy0AKZ4e6LQLkGeG8TVVV1Oe1nq21ZKIP2UhmpkXQcOd4d7zQt73h0TSq8oIyjNuPQQVJkuAtu
 rWihFQYIebwqfFUqfHKJ0FtLvsMxkelVcy4PEGiKzIK6RCyyPmvgrcmhtxDN11Ql1n4v9ywXCyL
 SUZcd/hiedDnXJTCwgmF+nZ9f4tTvtpYQ5T1s50pi8bQ5hKQ10gtqeCuu1G2GXYhpBTGuQ8vrLp
 MII4sOpl8xF5d6fhVS0O+krSRdLR+C2QKTDGGxk12aBdgi3q+ZAiae/W+b6aWs3l8SEqHrTzq0T
 Qcqzh9TIfTXpXunrUAw==
X-Authority-Analysis: v=2.4 cv=Go/XaU1C c=1 sm=1 tr=0 ts=6aa20d0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CbMfP9IJxQ5wjS32uxIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100018

xhci_endpoint_init() picks the ring's segment pool based on whether the
endpoint has already been tagged via xhci_sideband_add_endpoint():
sideband-tagged endpoints get their ring allocated from the offload
client's own segment_pool instead of the shared xhci->segment_pool, so the
buffer reported to the ADSP over QMI is guaranteed to come from a page
meant to be ADSP-visible.

xhci_sideband_add_endpoint() must therefore run before the endpoint's
transfer ring is first allocated (i.e. before snd_usb_endpoint_prepare()
triggers xhci_endpoint_init()) for that pool selection to apply to the
first allocation. Move the xhci_sideband_add_endpoint() calls out of
uaudio_endpoint_setup() and into enable_audio_stream(), before
snd_usb_endpoint_prepare() is called for the data and sync endpoints,
and unwind them on the new error paths.

At that point in the setup sequence dev->ep_in[]/ep_out[] are not yet
populated, since the endpoint's altsetting has not been activated, so
usb_pipe_endpoint() cannot be used to find the usb_host_endpoint. Add
uaudio_find_host_endpoint(), which resolves it directly from the
interface's altsetting descriptor table instead.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 96 +++++++++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 14 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index c94b15423a9a..bb5a0d54cd72 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -943,6 +943,45 @@ static void uaudio_dev_release(struct kref *kref)
 	wake_up(&dev->disconnect_wq);
 }
 
+/**
+ * uaudio_find_host_endpoint() - look up usb_host_endpoint for a snd_usb_endpoint
+ * @subs: usb substream owning the target snd_usb_endpoint
+ * @endpoint: sync or data snd_usb_endpoint to resolve
+ *
+ * usb_pipe_endpoint() resolves via dev->ep_in[]/ep_out[], which are only
+ * populated once usb_set_interface() has activated the endpoint's altsetting
+ * (i.e. after snd_usb_endpoint_prepare() has run for it). Looking that up
+ * beforehand returns NULL.
+ *
+ * Instead, look the endpoint up directly in the interface's altsetting
+ * descriptor table, which is populated once at enumeration time and stays
+ * valid regardless of which altsetting is currently active.
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
@@ -960,8 +999,9 @@ static void uaudio_dev_release(struct kref *kref)
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
@@ -999,17 +1039,49 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 			goto detach_ep;
 		}
 
+		data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint);
+		if (!data_ep) {
+			dev_err(&subs->dev->dev, "data ep # %d not found\n",
+				subs->data_endpoint->ep_num);
+			ret = -ENODEV;
+			goto detach_ep;
+		}
+
+		ret = xhci_sideband_add_endpoint(uadev[card_num].sb, data_ep,
+						 uadev[card_num].segment_pool);
+		if (ret < 0) {
+			dev_err(&subs->dev->dev,
+				"failed to add data ep to sec intr: %d\n", ret);
+			goto detach_ep;
+		}
+
 		if (subs->sync_endpoint) {
+			sync_ep = uaudio_find_host_endpoint(subs, subs->sync_endpoint);
+			if (!sync_ep) {
+				dev_err(&subs->dev->dev, "sync ep # %d not found\n",
+					subs->sync_endpoint->ep_num);
+				ret = -ENODEV;
+				goto remove_data_ep;
+			}
+
+			ret = xhci_sideband_add_endpoint(uadev[card_num].sb, sync_ep,
+							 uadev[card_num].segment_pool);
+			if (ret < 0) {
+				dev_err(&subs->dev->dev,
+					"failed to add sync ep to sec intr: %d\n", ret);
+				goto remove_data_ep;
+			}
+
 			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 			if (ret < 0)
-				goto detach_ep;
+				goto remove_sync_ep;
 		}
 
 		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 		if (ret < 0)
-			goto detach_ep;
+			goto remove_sync_ep;
 
-		dev_dbg(uaudio_qdev->data->dev,
+		dev_dbg(&subs->dev->dev,
 			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
 			subs->direction ? "capture" : "playback",
 			subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
@@ -1021,6 +1093,11 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 
 	return 0;
 
+remove_sync_ep:
+	if (sync_ep)
+		xhci_sideband_remove_endpoint(uadev[card_num].sb, sync_ep);
+remove_data_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, data_ep);
 detach_ep:
 	snd_usb_hw_free(subs);
 
@@ -1142,15 +1219,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
 
-	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep,
-					 uadev[card_num].segment_pool);
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
@@ -1641,7 +1709,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
+					  datainterval, pcm_card_num);
 
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,

-- 
2.34.1

